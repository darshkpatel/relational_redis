WARBLER_CONFIG = {}


ENV['GEM_HOME'] = File.expand_path('../..', __FILE__)


ENV['BUNDLE_GEMFILE'] = File.expand_path('../../redis-stat/Gemfile', __FILE__)

require 'rubygems'
$LOAD_PATH.unshift __FILE__.sub(/!.*/, '!/redis-stat/lib')
ENV['BUNDLE_WITHOUT'] = 'development:test:assets'

