class Image < ActiveRecord::Base
	attr_accessible :file, :rental_id

	belongs_to :rental

	mount_uploader :file, PictureUploader
end