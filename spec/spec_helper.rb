require 'active_record' 
require 'carrierwave'
require 'tempfile'
require 'bundler/setup'
require 'rspec'
require 'carrierwave/orm/activerecord'
require 'colored'
require 'factory_girl_rails'
require_relative '../lib/db' #FIXME need to fix this
include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :apartment do
    name "Curacao_Apartment"
    description  "Nice Apartment near the ocean good for drinking Blue-Curacao"
    picture File.open('spec/fixtures/images/blue-curacao.jpg', 'r')
  end

  factory :persoon do
    name "Leuke Persoon"
    picture File.open('spec/fixtures/images/blue-curacao.jpg', 'r')
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

def file_path( *paths )
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', *paths))
end

def public_path( *paths )
  File.expand_path(File.join(File.dirname(__FILE__), 'public', *paths))
end

CarrierWave.root = public_path

module CarrierWave
  module Test
    # taken from here : http://www.ruby-doc.org/gems/docs/m/mm-carrierwave-0.0.2/CarrierWave/Test/MockFiles.html
    module MockFiles
      def stub_file(filename, mime_type=nil, fake_name=nil)
        f = File.open(file_path(filename))
        return f
      end

      def stub_tempfile(filename, mime_type=nil, fake_name=nil)
        raise "#{path} file does not exist" unless File.exist?(file_path(filename))

        t = Tempfile.new(filename)
        FileUtils.copy_file(file_path(filename), t.path)

        t.stub(:local_path => "",
                :original_filename => filename || fake_name,
                :content_type => mime_type)

        return t
      end
    end

    module I18nHelpers
      def change_locale_and_store_translations(locale, translations, &block)
        current_locale = I18n.locale
        begin
          I18n.backend.store_translations locale, translations
          I18n.locale = locale
          yield
        ensure
          I18n.reload!
          I18n.locale = current_locale
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include CarrierWave::Test::MockFiles
  config.include CarrierWave::Test::I18nHelpers
end
