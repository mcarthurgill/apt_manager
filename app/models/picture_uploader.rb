class PictureUploader < CarrierWave::Uploader::Base

	include Cloudinary::CarrierWave

	def cache_dir
	  "#{Rails.root}/tmp/uploads"
	end

	process :convert => 'png'

	version :square do
	  cloudinary_transformation :width => 200, :height => 200, :crop => :fill, :gravity => :face
	end

	version :slideshow do
	  cloudinary_transformation :width => 1170, :height => 400, :crop => :fill
	end

	version :thumb do
	  resize_to_fit 170, 120
	end

end