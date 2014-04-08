module CarrierWave
  module Storage
    module DB
      class ActiveRecordFile < ::ActiveRecord::Base
        self.table_name = CarrierWave::Uploader::Base.active_record_tablename
        # puts parent.parent.parent.parent.inspect
        puts table_name.inspect
        alias_method    :delete, :destroy
        alias_attribute :read, :data

        attr_accessible :identifier,
                        :original_filename,
                        :content_type,
                        :size,
                        :data
      end # ActiveRecordFile

    end # ActiveRecord
  end # Storage
end # CarrierWave
