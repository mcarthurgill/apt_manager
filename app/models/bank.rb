class Bank < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude, :gmaps

  acts_as_gmappable, :process_geocoding => false
end
