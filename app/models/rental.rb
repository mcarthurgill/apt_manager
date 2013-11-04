class Rental < ActiveRecord::Base
  attr_accessible :name, :rent, :user_id
end
