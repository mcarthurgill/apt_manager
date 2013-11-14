class AddDummyIdToBgImages < ActiveRecord::Migration
  def change
  	add_column :bg_images, :dummy_id, :integer, default: 1
  end
end
