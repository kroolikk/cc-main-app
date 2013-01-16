class Place < ActiveRecord::Base
  attr_protected :id

  after_validation :geocode 
  geocoded_by :full_street_address

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts



  def full_street_address
    result = ''
    result += street if street.present?
    result += ' ' if result.present?
    result += street_no if street_no.present?
    result += ', ' if result.present?
    result += zip_code if zip_code.present?
    result += ' ' if result.present?
    result += city if city.present?

    Rails.logger.info "----------#{result}------------"

    result
  end

end
