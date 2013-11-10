class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.integer :user_id
      t.integer :rental_id
      t.text :request

      t.timestamps
    end
  end
end
