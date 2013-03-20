# -*- encoding: utf-8 -*-
class Preference < ActiveRecord::Base
  attr_protected :id

  mount_uploader :image, ImageUploader

  validates :name, :presence => true
  validates :image, :presence => true

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable

  has_many :users_preferences
  has_many :users, :through => :users_preferences
end
