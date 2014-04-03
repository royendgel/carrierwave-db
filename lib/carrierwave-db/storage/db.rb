require 'active_record'
require 'carrierwave'
module CarrierWave
  module Storage
    module DB
      autoload :VERSION,          'carrierwave-db/version'
      autoload :StorageProvider,  'carrierwave-db/storage/storage_provider'
      autoload :File,             'carrierwave-db/storage/file'
      autoload :ActiveRecordFile, 'carrierwave-db/storage/active_record_file'
    end
  end

  module Uploader
    class Base

      add_config :download_path_prefix
      add_config :active_record_tablename

      configure do |config|
        config.storage_engines[:db] = 'CarrierWave::Storage::DB::StorageProvider'
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