require 'spec_helper'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "db/database.db"
)
# added this to test quickly
unless ActiveRecord::Base.connection.table_exists? 'apartments'
  puts '=====>>>>>Creating new table !!!<======='.green
  ActiveRecord::Migration.create_table :apartments do |t|
    t.string        :name
    t.string        :description
    t.binary        :picture

    t.timestamp

    t.string  :identifier
    t.string  :original_filename
    t.string  :content_type
    t.integer :size
    t.binary  :data

  end

  ActiveRecord::Migration.create_table :persoons do |t|
  t.string        :name
    t.string        :description
  t.binary        :picture

  t.timestamp

  t.string  :identifier
  t.string  :original_filename
  t.string  :content_type
  t.integer :size
  t.binary  :data

  end
end

class PersoonUploader < CarrierWave::Uploader::Base

  storage :db
  store_dir :persoons
end

class ApartmentUploader < CarrierWave::Uploader::Base
  storage :db
  store_dir :apartments
end

class Apartment < ActiveRecord::Base
  mount_uploader :picture, ApartmentUploader
end

class Persoon < ActiveRecord::Base
  mount_uploader :picture, PersoonUploader
end

describe Apartment do
  it "it stores a apartment in the database with a picture" do

    ap = Apartment.new
    ap = FactoryGirl.create(:apartment)
    expect(Apartment.first.picture.to_s).to start_with('/files/')
  end
end

describe Persoon do
  it "it stores a Persoon in the database with a picture" do
    pr = Persoon.new
    pr = FactoryGirl.create(:persoon)
    expect(Persoon.first.picture.to_s).to start_with('/files/')
  end
end

describe "Get the picture of Apartment and store it to the disk" do
  it '' do
    raise Apartment.first.picture
  end
end
describe "Get the picture of Persoon and store it to the disk" do
  it '' do

  end
end

# puts ap.tellme
# puts Factofind_by_identifier!ryGirl.methods.sort
# puts CarrierWave::Storage::DB::File
# puts a.methods.sort
# a.store!(f)
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