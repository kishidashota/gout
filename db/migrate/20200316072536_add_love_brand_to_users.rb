class AddLoveBrandToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :love_brand, :integer
  end
end
