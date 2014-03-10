# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "carrierwave-db/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-db"
  s.version     = CarrierwaveDB::VERSION
  s.authors     = ["Royendgel Silberie "]
  s.email       = ["royendgel@gmail.com"]
  s.homepage    = "https://github.com/royendgel/carrierwave-db"
  s.summary     = %q{Upload to database (blob)}
  s.description = %q{Upload your files directly in databse}
  s.required_ruby_version = ">= 1.9.0"

  s.add_dependency "carrierwave", [">= 0.6.2"]
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails", ">= 3.2.12"
  s.add_development_dependency "rake"
end