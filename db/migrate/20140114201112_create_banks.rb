class CreateBanks < ActiveRecord::Migration
	def change
    create_table :banks do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.timestamps
    end
  end
end
