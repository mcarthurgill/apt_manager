class Payment < ActiveRecord::Base
  attr_accessible :amount, :type, :user_id

  belongs_to :user
end
