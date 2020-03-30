class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string          :shop_name,     null:false
      t.text            :description,   null:false
      t.string          :address,       null:false
      t.string          :food_image   
      t.integer         :user_id
      t.timestamps
    end
  end
end
