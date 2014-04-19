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
  t.string        :picture

  t.timestamps

  t.string  :identifier
  t.string  :original_filename
  t.string  :content_type
  t.integer :size
  t.binary  :data
end

class ApartmentUploader < CarrierWave::Uploader::Base
  storage :db
end

class Apartment < ActiveRecord::Base
  mount_uploader :picture, ApartmentUploader
  skip_callback :save, :after, :store_picture!

  private

  def write_picture_identifier
    # we skip the after_save 'store_picture!' and in the before_save 'write_picture_identifier' we call super and then store_picture! 
    # and then copy our file attributes into the yet unsaved record. After that, it's saved... 
    super
    store_picture!
    %w(identifier original_filename content_type size data). each do |attr|
      self[attr] = self.picture.file.file[attr]
    end
  end

end

ap = FactoryGirl.create(:apartment)
puts ap.inspect
bp = Apartment.first
puts bp.inspect