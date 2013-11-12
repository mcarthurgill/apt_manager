class MaintenanceRequest < ActiveRecord::Base
  attr_accessible :rental_id, :request, :user_id, :complete

  belongs_to :user
  belongs_to :rental

  scope :pending, -> { where(:complete => false).order("created_at ASC") }
  scope :completed, -> { where(:complete => true).order("updated_at DESC") }
end
