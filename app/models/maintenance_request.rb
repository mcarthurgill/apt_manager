class MaintenanceRequest < ActiveRecord::Base
  attr_accessible :rental_id, :request, :user_id

  belongs_to :user
  belongs_to :rental
end
