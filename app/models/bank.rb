class Bank < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude, :gmaps, :address, :phone

  geocoded_by :address

  after_validation :geocode

end
