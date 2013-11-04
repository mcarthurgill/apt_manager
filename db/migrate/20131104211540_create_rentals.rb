class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.string :name
      t.integer :rent

      t.timestamps
    end
  end
end
