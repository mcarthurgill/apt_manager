class BgImage < ActiveRecord::Base
  attr_accessible :file

  belongs_to :dummy

  mount_uploader :file, PictureUploader

  before_destroy :delete_from_cloudinary

  private

  def delete_from_cloudinary   
  	p "*"*50
  	p "deleting from cloudinary..."
    public_id = self.file.model.file.identifier.split("/").last.split(".").first
    p "public_id: #{public_id}"
    p "*"*50  	
    Cloudinary::Uploader.destroy(public_id)
  end 
end
