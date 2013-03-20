# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

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
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    asset_path("fallback/" + [version_name, "default_photo.png"].compact.join('_'))
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  # logo miejsca i avatar uzytkownika 300x300 | dla logotypu miejsca scale to fit, dla avatara scale to fill.
  # mini logo miejsca do uzytku na mapie 100x100px scale to fit. idealnie by bylo przy logotypach zeby dorobic biale tlo w obrazku jak paperclip na stolcu robil.


  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  version :medium_fit do
    process :resize_to_fit => [300, 300]
  end

  version :medium_fill do
    process :resize_to_fill => [300, 300]
  end


  if false
    #%w[red green blue purple black].each do |color|
    %w[red green].each do |color|
      version(color) { process stamp: color }
    end

    def stamp(color)
      manipulate! format: "jpg" do |source|        
        source = source.resize_to_fill(100, 100).quantize(256, Magick::GRAYColorspace).contrast(true)        
        colored = Magick::Image.new(100, 100) { self.background_color = color }
        colored.composite(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
      end
      # manipulate! format: "png" do |source|
        # overlay_path = Rails.root.join("app/assets/images/stamp_overlay.png")
        # overlay = Magick::Image.read(overlay_path).first
        # source = source.resize_to_fill(100, 100).quantize(256, Magick::GRAYColorspace).contrast(true)
        # source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
        # colored = Magick::Image.new(100, 100) { self.background_color = color }
        # colored.composite(source.negate, 0, 0, Magick::CopyOpacityCompositeOp)
      # end
    end
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
