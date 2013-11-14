class CreateBgImages < ActiveRecord::Migration
  def change
    create_table :bg_images do |t|
      t.string :file

      t.timestamps
    end
  end
end
