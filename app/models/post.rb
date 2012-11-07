class Post < ActiveRecord::Base
  attr_accessible :description, :slug, :start_date, :title, :photos_attributes

  validates :title, :presence => true


  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
end
