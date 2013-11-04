class Rental < ActiveRecord::Base
  attr_accessible :name, :rent, :user_id

  belongs_to :user

  scope :matches, -> { where('user_id is not null') }

end
