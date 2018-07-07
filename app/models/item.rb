class Item < ApplicationRecord

before_validation :price_to_i
validates :title, :location, presence: true, length: { maximum: 100 }
validates :description, presence: true,  length: { maximum: 600 }
validates :price, numericality: { greater_than: 0}, unless: :is_free?
validates :available_to, :available_from, presence: true
validate :is_date?
validate :check_dates
after_validation :geocode
after_validation :set_city
before_save :lat_long?
before_save :check_places
has_many :favourites, dependent: :destroy
mount_uploader :photo, PhotoUploader
belongs_to :user
geocoded_by :location


  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.country_code = geo.country_code
      obj.country = geo.country
    end
  end
  after_validation :reverse_geocode
  def set_city
    self.city = self.location.split(",")[0]
  end
  def is_free?
    self.free
  end
  def self.string_query(params1, params2)
    Item.where("country LIKE  ? AND available_to >= ?", params1 , params2 )
  end

  def self.city_query(params1, params2, params3)
    Item.where("city LIKE  ? AND country LIKE ? AND available_to >= ?", params1 , params2, params3)
  end

  def self.country_query(params1, params2)
    Item.where("country LIKE ? AND available_to >= ?", params1 , params2 )
  end

  def check_dates
    if available_to && available_from && available_to <= available_from
      errors.add :available_from, "The final date must be greater than the initial one"
    end
  end


  def is_date?
    if !(available_to.class == Date) || !(available_from.class == Date)
      errors.add :available_to, "Please insert a date"
      errors.add :available_from, "Please insert a date"
    end
  end

  def lat_long?
    if !(latitude) || !(longitude)
      errors.add :location, "Please insert again the location"
    end
  end

  def check_places
    if !city || !country || !country_code
      errors.add :location, "Please insert again the location"
    end
  end

  def price_to_i
    price = price.to_i
  end



end
