class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
