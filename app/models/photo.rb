class Photo < ActiveRecord::Base
  attr_accessible :post_id, :photo, :slug, :title

  mount_uploader :photo, PhotoUploader

  belongs_to :post


  def self.recreate_all_photos
    photos = Photo.all
    
    photos.each do |p|
      if p.photo.present?
        p.photo.cache_stored_file!
        p.photo.recreate_versions!
      end
    end
  end
end
