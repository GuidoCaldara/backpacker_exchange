class Item < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  geocoded_by :location
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.country_code = geo.country_code
      obj.country = geo.country
      obj.city = geo.city
    end
  end
  after_validation :reverse_geocode


  def self.string_query(params1, params2)
    Item.where("country LIKE  ? AND available_to > ?", params1 , params2 )
  end

  def self.city_query(params1, params2, params3)
    Item.where("city LIKE  ? AND country LIKE ? AND available_to > ?", params1 , params2, params3)
  end

  def self.country_query(params1, params2)
    Item.where("country LIKE ? AND available_to > ?", params1 , params2 )
  end


end
