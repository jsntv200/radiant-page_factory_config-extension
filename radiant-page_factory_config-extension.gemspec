# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-page_factory_config-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-page_factory_config-extension"
  s.version     = RadiantPageFactoryConfigExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantPageFactoryConfigExtension::AUTHORS
  s.email       = RadiantPageFactoryConfigExtension::EMAIL
  s.homepage    = RadiantPageFactoryConfigExtension::URL
  s.summary     = RadiantPageFactoryConfigExtension::SUMMARY
  s.description = RadiantPageFactoryConfigExtension::DESCRIPTION

  # s.add_dependency "radiant-page_factory-extension", "~> 2.0.0"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end

  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  s.require_paths = ["lib"]
end
