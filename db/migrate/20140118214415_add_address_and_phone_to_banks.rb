class AddAddressAndPhoneToBanks < ActiveRecord::Migration
  def change
  	add_column :banks, :address, :string
  	add_column :banks, :phone, :string
  end
end
