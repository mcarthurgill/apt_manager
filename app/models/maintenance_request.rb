class MaintenanceRequest < ActiveRecord::Base
  attr_accessible :rental_id, :request, :user_id
end
