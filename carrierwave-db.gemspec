# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "carrierwave-db/storage/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-db"
  s.version     = CarrierwaveDB::VERSION
  s.authors     = ["Royendgel Silberie "]
  s.email       = ["royendgel@gmail.com"]
  s.homepage    = "https://github.com/royendgel/carrierwave-db"
  s.summary     = %q{Upload to database (blob)}
  s.description = %q{Upload your files directly in databse}
  s.required_ruby_version = ">= 1.9.0"


  files_to_include = %w{
    README.md

    Rakefile

    lib/db.rb
    lib/carrierwave-db/storage/active_record_file.rb
    lib/carrierwave-db/storage/file.rb
    lib/carrierwave-b/storage/storage_provider.rb
    lib/carrierwave-db/storage/version.rb

    spec/spec_helper.rb
    spec/database_setup.rb
    spec/lib/carrierwave-activerecord/storage/file_spec.rb
    spec/lib/carrierwave-activerecord/storage/storage_provider_spec.rb
    spec/lib/carrierwave-activerecord/carrierwave-activerecord_spec.rb
  }

  gem.files         = files_to_include
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  # CarrierWave has broken in 0.x releases.
  gem.add_runtime_dependency 'carrierwave'

  # ActiveRecord 3.3 is unlikely, but prevent it just in case.
  gem.add_runtime_dependency 'activerecord', '~> 3.2.0'

  gem.add_development_dependency 'sqlite3', '~> 1.3'
  gem.add_development_dependency 'rspec', '~> 2.12'

  gem.platform = Gem::Platform::RUBY
  gem.required_ruby_version = '>= 1.9.3'
  s.add_dependency "carrierwave", [">= 0.6.2"]
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails", ">= 3.2.12"
  s.add_development_dependency "rake"
  
end