class AddImagesTable < ActiveRecord::Migration
  def change
  	create_table :images do |t|
  		t.integer :rental_id
  		t.string :file	

  		t.timestamps
  	end
  end
end
