# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

require 'carrierwave-db/storage/version'

Gem::Specification.new do |gem|
  gem.name        = "carrierwave-db"
  gem.version     = CarrierwaveDB::VERSION
  gem.authors     = ["Royendgel Silberie "]
  gem.email       = ["royendgel@gmail.com"]
  gem.homepage    = "https://github.com/royendgel/carrierwave-db"
  gem.summary     = %q{Upload to database (blob)}
  gem.description = %q{Upload your files directly in databse}
  #  gem.required_ruby_version = ">= 1.9.0"
  gem.require_paths = ['lib']


files_to_include = %w{
    LICENSE
    README.md

    Rakefile

    carrierwave-db.gemspec

    lib/db.rb
    lib/carrierwave-db/storage/active_record_file.rb
    lib/carrierwave-db/storage/file.rb
    lib/carrierwave-db/storage/storage_provider.rb
    lib/carrierwave-db/storage/version.rb

    spec/spec_helper.rb
    spec/lib/carrierwave-db/storage/file_spec.rb
    spec/lib/carrierwave-db/storage/storage_provider_spec.rb
    spec/lib/carrierwave-db/carrierwave-activerecord_spec.rb
  }

  gem.files         = files_to_include
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  # # CarrierWave has broken in 0.x releases.
  gem.add_runtime_dependency 'carrierwave', '~> 0.8.0'

  # ActiveRecord 3.3 is unlikely, but prevent it just in case.
  gem.add_runtime_dependency 'activerecord', '~> 3.2.0'

  gem.add_development_dependency 'sqlite3', '~> 1.3'
  gem.add_development_dependency 'rspec', '~> 2.12'

  gem.platform = Gem::Platform::RUBY
  gem.required_ruby_version = '>= 1.9.3'
end
