class Post < ActiveRecord::Base
  attr_accessible :description, :slug, :start_date, :title

  extend FriendlyId
  friendly_id :title, use: :slugged
end
