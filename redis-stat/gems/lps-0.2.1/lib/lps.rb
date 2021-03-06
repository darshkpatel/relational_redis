require "lps/version"
require 'option_initializer'

# @!attribute [r] freq
#   @return [Number] Loop frequency
# @!attribute [r] interval
#   @return [Number] Loop interval (inverse of frequency)
class LPS
  include OptionInitializer
  option_initializer! :freq, :interval => Numeric, :while => :&
  option_validator :freq do |v|
    msg = 'frequency must be a positive number (or nil)'
    raise TypeError, msg unless v.is_a?(Numeric) || v.nil?
    raise ArgumentError, msg if v.is_a?(Numeric) && v <= 0
  end
  option_validator :interval do |v|
    raise ArgumentError, 'interval must be a non-negative number' if v < 0
  end

  attr_reader :freq, :interval

  # Main loop
  # @param [Proc] block Loop
  def loop &block
    ret = nil
    always = @while.nil?

    if @freq.nil?
      while always || @while.call
        ret = block.call self

        # Frequency set!
        return loop(&block) if @freq
      end
    else
      nt = Time.now
      while always || @while.call
        ret = block.call self

        # Frequency unset!
        return loop(&block) unless @freq

        nt   += @interval
        now   = Time.now
        diff  = nt - now

        if diff > 0.01
          sleep diff
        elsif diff < 0
          nt = now
        end
      end
    end
    ret
  end

  # Changes loop frequency
  # @param [Number|nil] f Loop frequency
  # @return [Number|nil]
  def freq= f
    validate_options(:freq => f)

    @freq, @interval = [f, f ? 1.0 / f : 0]
    @freq
  end

  # Changes loop interval
  # @param [Number] intv Loop interval
  # @return [Number]
  def interval= intv
    validate_options(:interval => intv)

    @freq, @interval = [(intv == 0) ? nil : 1.0 / intv, intv]
    @interval
  end

  # @param [Hash] opts Options Hash.
  # @option opts [Numeric] :freq Frequency of loop execution (loops/sec)
  # @option opts [#call] :cond Loop condition
  # @private
  def initialize opts = {}
    validate_options opts

    freq, intv, @while = opts.values_at :freq, :interval, :while
    raise ArgumentError,
      "can't have both frequency and interval" if freq && intv

    @freq =
      if freq
        freq
      elsif intv
        (intv == 0) ? nil : 1.0 / intv
      else
        nil
      end
    @interval = @freq ? 1.0 / @freq : 0
  end
end

