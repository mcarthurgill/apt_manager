class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :title
      t.interger :user_id
      t.integer :rental_id
      t.string :file

      t.timestamps
    end
  end
end
