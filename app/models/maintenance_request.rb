class MaintenanceRequest < ActiveRecord::Base
  attr_accessible :rental_id, :request, :user_id, :complete

  belongs_to :user
  belongs_to :rental

  scope :pending, -> { where(:complete => false).order("user_id ASC") }
  scope :completed, -> { where(:complete => true).order("user_id ASC") }
end
