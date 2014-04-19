require 'active_record'
require 'carrierwave'

module CarrierWave

  module Storage
    module DB
      autoload :VERSION,          'carrierwave-db/storage/version'
      autoload :StorageProvider,  'carrierwave-db/storage/storage_provider'
      autoload :File,             'carrierwave-db/storage/file'
      autoload :ActiveRecordFile, 'carrierwave-db/storage/active_record_file'
    end
  end

  module Uploader
    class Base

      configure do |config|
        config.storage_engines[:db] = 'CarrierWave::Storage::DB::StorageProvider'
      end

    end # Base
  end # Uploader

end # CarrierWave
