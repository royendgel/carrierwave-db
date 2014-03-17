# require 'lib/carrierwave/storage/db.rb'
require File.join(File.dirname(__FILE__), 'lib/carrierwave/storage/db.rb')

class ApartmentUploader < CarrierWave::Uploader::Base
  storage :db
end
a = ApartmentUploader.new()
fstring = "Hey People I want to get this thing work In Curacao ASAP!!"
f = File.open('workforme.txt', 'w')
f.write(fstring)
a.store!(f)
# a.extension
