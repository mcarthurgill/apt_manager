class Dummy < ActiveRecord::Base
  attr_accessible :bg_images_attributes

  has_many :bg_images
  
  accepts_nested_attributes_for :bg_images, :allow_destroy => true
end
