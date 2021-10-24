# -*- encoding: utf-8 -*-
# stub: rspec-autotest 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-autotest".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steven Baker".freeze, "David Chelimsky".freeze, "Chad Humphries".freeze]
  s.date = "2014-06-01"
  s.description = "RSpec Autotest integration".freeze
  s.email = "rspec-users@rubyforge.org".freeze
  s.homepage = "https://github.com/rspec/rspec-autotest".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "rspec-autotest-1.0.0".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rspec-core>.freeze, [">= 2.99.0.beta1", "< 4.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 10.0.0"])
    s.add_development_dependency(%q<ZenTest>.freeze, [">= 4.6"])
    s.add_development_dependency(%q<activesupport>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<rspec-core>.freeze, [">= 2.99.0.beta1", "< 4.0.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 10.0.0"])
    s.add_dependency(%q<ZenTest>.freeze, [">= 4.6"])
    s.add_dependency(%q<activesupport>.freeze, ["~> 3.0"])
  end
end
