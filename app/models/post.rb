class Post < ActiveRecord::Base
  attr_protected :id

  validates :title, :presence => true
  validates :category_id, :presence => true


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true


  def self.active
    where("start_date <= '#{Time.now.to_s(:db)}'")
  end

  def self.promoted
    where("promoted IS NOT NULL AND promoted > 0")
  end

  def self.normal
    where("promoted IS NULL OR promoted = 0")
  end

  def main_photo
    photos = self.photos
    if photos.present?
      main_photo = photos.first
    else
      main_photo = {}
    end
    main_photo
  end

  def main_photo_link(ver="thumb")
    main_photo = self.main_photo
    if false # main_photo.present?
      photo_link = main_photo.photo.send(ver).url
    else
      photo_link = "/assets/test.png"
    end
    photo_link
  end
end
