# -*- encoding: utf-8 -*-
# stub: cucumber-sinatra 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cucumber-sinatra".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bernd Ahlers".freeze]
  s.date = "2012-04-01"
  s.description = "This little gem will help you to initialize a cucumber environment for a sinatra application. It will generate the required files from templates.".freeze
  s.email = "bernd@tuneafish.de".freeze
  s.executables = ["cucumber-sinatra".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "LICENSE".freeze]
  s.files = ["LICENSE".freeze, "README.md".freeze, "bin/cucumber-sinatra".freeze]
  s.homepage = "http://github.com/bernd/cucumber-sinatra".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Initialize a cucumber environment for sinatra".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<templater>.freeze, [">= 1.0.0"])
  else
    s.add_dependency(%q<templater>.freeze, [">= 1.0.0"])
  end
end
