# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  
  # Nie wiem któr¹ opcje trzeba dac fill||fit dla zdjec, bo generalnie ograniczamy tylko szerokosc, help???
  # edit: na stackoverflow napisali ze podaje sie width = 392 a height 10000 scale to fit, 10000 zeby nigdy nie osiagnelo tego limitu.
  # Do wszystkich boxow w2-w4 image ma miec maks width 392px, wysokosc dowolna.
  # glowne zdjecie artykulu ma miec max width 530px, pozostale zdjecia  392px. wysokosc dowolna.
  # logo miejsca i avatar uzytkownika 300x300 | dla logotypu miejsca scale to fit, dla avatara scale to fill.
  # mini logo miejsca do uzytku na mapie 100x100px scale to fit. idealnie by bylo przy logotypach zeby dorobic biale tlo w obrazku jak paperclip na stolcu robil.
  # slider na stronie glownej 600x200px scale to fill.
  
  version :thumb do
    process :resize_to_fill => [100, 60]
  end

  version :medium do
    process :resize_to_fill => [250, 150]
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
