class AddAvailabilityToRentalTable < ActiveRecord::Migration
  def change
  	add_column :rentals, :available, :boolean, :default => false
  end
end
