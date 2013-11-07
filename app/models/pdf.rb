class Pdf < ActiveRecord::Base
  attr_accessible :file, :rental_id, :title, :user_id

  belongs_to :user
  belongs_to :rental

  mount_uploader :file, PdfUploader
end
