# -*- encoding: utf-8 -*-
# stub: option_initializer 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "option_initializer".freeze
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Junegunn Choi".freeze]
  s.date = "2013-04-07"
  s.description = "Object construction with method chaining".freeze
  s.email = ["junegunn.c@gmail.com".freeze]
  s.homepage = "https://github.com/junegunn/option_initializer".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Object construction with method chaining".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
