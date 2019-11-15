class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :title
      t.string :image_id
      t.string :details
      t.text :address
      t.string :station
      t.datetime :start_date
      t.timestamps
    end
  end
end
