class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role, :nick, :name, :surname, :image, :image_cache


  extend FriendlyId
  friendly_id :email, use: :slugged


  mount_uploader :image, ImageUploader


  has_many :users_preferences
  has_many :preferences, :through => :users_preferences


  acts_as_taggable


  def update_preferences(prefs=nil)
    if prefs.present?
      self.users_preferences.each do |up|
        up.destroy
      end
      prefs.each do |pt|
        self.users_preferences.create(:preference_id => pt[1])
      end
    end
  end

end
