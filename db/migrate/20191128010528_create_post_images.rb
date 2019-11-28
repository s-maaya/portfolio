class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :room_id
      t.integer :user_id
      t.string :post_image_id

      t.timestamps
    end
  end
end
