class AddIndexToPosts < ActiveRecord::Migration[5.2]
  def change
    add_index :posts, :assortment, length: 50
  end
end
