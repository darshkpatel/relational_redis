# -*- encoding: utf-8 -*-
# stub: tabularize 0.2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "tabularize".freeze
  s.version = "0.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Junegunn Choi".freeze]
  s.date = "2012-09-06"
  s.description = "Formatting tabular data with paddings and alignments".freeze
  s.email = ["junegunn.c@gmail.com".freeze]
  s.homepage = "".freeze
  s.rubyforge_project = "tabularize".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Formatting tabular data".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_development_dependency(%q<ansi>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<unicode-display_width>.freeze, ["~> 0.1.1"])
    else
      s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
      s.add_dependency(%q<ansi>.freeze, [">= 0"])
      s.add_dependency(%q<unicode-display_width>.freeze, ["~> 0.1.1"])
    end
  else
    s.add_dependency(%q<awesome_print>.freeze, [">= 0"])
    s.add_dependency(%q<ansi>.freeze, [">= 0"])
    s.add_dependency(%q<unicode-display_width>.freeze, ["~> 0.1.1"])
  end
end
