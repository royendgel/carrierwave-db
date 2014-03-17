# encoding: utf-8
# Following http://carrierwave.rubyforge.org/rdoc/
# lib/carrierwave/storage/abstract.rb

# require 'carrierwave'
# module CarrierWave
  # module Storage
    # class DB < Abstract
#       
    	# def store! sanitized_file
    	  # puts "\n I'm in Store! \n"
    	  # puts sanitized_file.extension
    	  # puts sanitized_file.original_filename
    	  # puts sanitized_file.inspect
# 
#     	  
    	  # # puts file.methods.sort
    	  # # puts file.filename
    	# end # store!
    	# def retrieve!(identifier)
    		# # Bla bla bla bla bla do this store this store that
    	# end # retrieve!
    # end # DB 
  # end # Storage
# end # Carrierwave
# 
# 
# CarrierWave::Storage.autoload :DB, 'carrierwave/storage/db'
# 
# class CarrierWave::Uploader::Base
  # configure do |config|
    # config.storage_engines[:db] = "CarrierWave::Storage::DB"
  # end
# end
# abort 'ok'
require 'active_record'
require 'carrierwave'
module CarrierWave

  module Storage
    module ActiveRecord
      autoload :VERSION,          'carrierwave/version'
      autoload :StorageProvider,  'carrierwave/storage/storage_provider'
      autoload :File,             'carrierwave/storage/file'
      autoload :ActiveRecordFile, 'carrierwave/storage/active_record_file'
    end
  end

  module Uploader
    class Base

      add_config :download_path_prefix
      add_config :active_record_tablename

      configure do |config|
        config.storage_engines[:db] = 'CarrierWave::Storage::ActiveRecord::StorageProvider'
        config.download_path_prefix            = '/files'
        config.active_record_tablename         = 'carrier_wave_files'
      end

      def self.reset_config
        super
        configure do |config|
          config.download_path_prefix    = '/files'
          config.active_record_tablename = 'carrier_wave_files'
        end
      end
    end # Base
  end # Uploader

end # CarrierWave