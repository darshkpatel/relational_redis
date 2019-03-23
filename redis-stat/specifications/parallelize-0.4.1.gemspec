# -*- encoding: utf-8 -*-
# stub: parallelize 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "parallelize".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Junegunn Choi".freeze]
  s.date = "2013-04-26"
  s.description = "Simple multi-threading for Ruby".freeze
  s.email = "junegunn.c@gmail.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.markdown".freeze]
  s.files = ["LICENSE.txt".freeze, "README.markdown".freeze]
  s.homepage = "http://github.com/junegunn/parallelize".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Simple multi-threading for Ruby".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.6.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
    else
      s.add_dependency(%q<yard>.freeze, ["~> 0.6.0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
    end
  else
    s.add_dependency(%q<yard>.freeze, ["~> 0.6.0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 1.6.4"])
  end
end
