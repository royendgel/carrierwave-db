require 'spec_helper'
require 'carrierwave/storage/db'
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

ActiveRecord::Migration.create_table :apartments do |t|
  t.string :name
  t.binary :picture
  t.timestamp
end

class ApartmentUploader < CarrierWave::Uploader::Base
  storage :db
end
# class ApartmentUploader < CarrierWave::Uploader::Base
  # storage :db
# end

# class ApartmentUploader < CarrierWave::Uploader::Base
  # storage :db
# end

# describe CarrierWave::Storage::DB do
#   before do
#     CarrierWave.configure do |config|
#     end
# end
# end

# class Apartment < ActiveRecord::Base
  # mount_uploader :picture, ApartmentUploader
# end


# File.open 'temp.txt', 'w' do |f|
  # f.write 'hiaaa'
# end
f = File.open('test.txt', 'w')

a = ApartmentUploader.new()
a.store!(f)
# puts a.methods.sort
# puts a.class
# puts ApartmentUploader.methods.sort

# apartments = ApartmentUploader.new
# apartments.picture = File.open('spec/fixtures/images/blue-curacao.jpg')
# apartments.save!
# puts ApartmentUploader.methods.sort
# @upload CarrierWave::Storage::DB.new

# describe Apartment do
  # it "insert a Apartment without attachment and retrieve it back" do
    # subject.name = 'Nechi kas'
    # subject.picture = @uploader
    # subject.save!
    # Apartment.find(1).name.should eq('Nechi kas')
# end

  # it "insert a Apartment with attachment and retrieve it back" do
    # subject.name = 'Nechi kas'
    # subject.picture = @uploader.store! 'spec/fixtures/blue-curacao.jpg'
    # subject.save!
#     
    # Apartment.find(1).name.should eq('Nechi kas')
# 
  # end

# end