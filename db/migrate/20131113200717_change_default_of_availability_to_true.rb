class ChangeDefaultOfAvailabilityToTrue < ActiveRecord::Migration
  def change
  	change_column_default :rentals, :available, true 
  end
end
