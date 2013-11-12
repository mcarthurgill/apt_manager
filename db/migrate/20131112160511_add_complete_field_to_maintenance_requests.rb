class AddCompleteFieldToMaintenanceRequests < ActiveRecord::Migration
  def change
  	add_column :maintenance_requests, :complete, :boolean, :default => false
  end
end
