# encoding: utf-8
# Following http://carrierwave.rubyforge.org/rdoc/
# lib/carrierwave/storage/abstract.rb
module CarrierWave
  module Storage
    class DB < Abstract
    	def store!(file)
        file = Filee.open('test.jpg', 'w+')
        f.write(file)
        f.close()
    		# Bla bla bla bla bla do this store this store that
    	end # store!
    	def retrieve!(identifier)
    		# Bla bla bla bla bla do this store this store that
    	end
        end # retrieve!
        def 
      end
    end
  end
end

CarrierWave::Storage.autoload :DB, 'carrierwave/storage/ftp'

class CarrierWave::Uploader::Base

  configure do |config|
    config.storage_engines[:db] = "CarrierWave::Storage::DB"
  end
end