module CarrierWave
  module Storage
    module DB 

      class StorageProvider

        attr_reader :uploader

        def initialize(uploader)
          puts 'UPLOADSER MODEL' + uploader.model.inspect
          puts 'UPLOADSER MODEL TABKE NAME' + uploader.model.table_name.inspect
          
          @uploader = uploader
        end

        def store! sanitized_file
          @file = File.create! sanitized_file, uploader.identifier, uploader.store_dir
          set_file_properties
        end

        def retrieve! identifier
          @file = File.fetch! identifier
          set_file_properties
        end

        # identifier
        def identifier
          if uploader.filename
            @identifier ||= uploader.filename
          end
        end

        private

        def set_file_properties
          @file.url = compute_url
          @file
        end

        def compute_url
          uploader.default_url || begin
            if defined? ::Rails.application.routes.url_helpers
              model = uploader.model

              route_helpers = ::Rails.application.routes.url_helpers
              path_method_name = "#{model.class.to_s.underscore}_path"

              url = route_helpers.send(path_method_name, model)
              url << "/#{uploader.mounted_as.to_s}"
            else
              [ CarrierWave::Uploader::Base.download_path_prefix, @file.identifier ].join '/'
            end
          end
        end

      end # StorageProvider

    end # ActiveRecord
  end # Storage
end # CarrierWave


