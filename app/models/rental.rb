class Rental < ActiveRecord::Base
  attr_accessible :name, :rent, :user_id, :images_attributes

  belongs_to :user
  has_many :pdfs
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  scope :matches, -> { where('user_id is not null') }

end
