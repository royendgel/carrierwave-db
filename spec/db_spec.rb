require 'spec_helper'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "db/database.db"
)
# added this to test quickly
ActiveRecord::Migration.drop_table :apartments if ActiveRecord::Base.connection.table_exists? 'apartments'

ActiveRecord::Migration.create_table :apartments do |t|
  t.string        :name
  t.string        :description
  t.binary        :picture

  t.timestamps

  t.string  :identifier
  t.string  :original_filename
  t.string  :content_type
  t.integer :size
  t.binary  :data
end

class ApartmentUploader < CarrierWave::Uploader::Base
  storage :db
  store_dir :apartments
end

class Apartment < ActiveRecord::Base
  mount_uploader :picture, ApartmentUploader
end

ap = FactoryGirl.create(:apartment)

