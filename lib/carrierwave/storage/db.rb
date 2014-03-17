# encoding: utf-8
# Following http://carrierwave.rubyforge.org/rdoc/
# lib/carrierwave/storage/abstract.rb

require 'carrierwave'
module CarrierWave
  module Storage
    class DB < Abstract
      
    	def store! sanitized_file
    	  puts "\n I'm in Store! \n"
    	  puts sanitized_file.extension
    	  puts sanitized_file.original_filename
    	  puts sanitized_file.inspect

    	  
    	  # puts file.methods.sort
    	  # puts file.filename
    	end # store!
    	def retrieve!(identifier)
    		# Bla bla bla bla bla do this store this store that
    	end # retrieve!
    end # DB 
  end # Storage
end # Carrierwave


CarrierWave::Storage.autoload :DB, 'carrierwave/storage/db'

class CarrierWave::Uploader::Base
  configure do |config|
    config.storage_engines[:db] = "CarrierWave::Storage::DB"
  end
end