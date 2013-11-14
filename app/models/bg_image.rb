class BgImage < ActiveRecord::Base
  attr_accessible :file

  belongs_to :dummy

  mount_uploader :file, PictureUploader
end
