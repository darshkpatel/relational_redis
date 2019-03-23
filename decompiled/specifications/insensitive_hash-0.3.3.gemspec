# -*- encoding: utf-8 -*-
# stub: insensitive_hash 0.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "insensitive_hash".freeze
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Junegunn Choi".freeze]
  s.date = "2013-09-01"
  s.description = "Hash with case-insensitive, Symbol/String-indifferent key access".freeze
  s.email = ["junegunn.c@gmail.com".freeze]
  s.homepage = "https://github.com/junegunn/insensitive_hash".freeze
  s.rubyforge_project = "insensitive_hash".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Case-insensitive Ruby Hash".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<test-unit>.freeze, [">= 2.3.0"])
    else
      s.add_dependency(%q<test-unit>.freeze, [">= 2.3.0"])
    end
  else
    s.add_dependency(%q<test-unit>.freeze, [">= 2.3.0"])
  end
end
