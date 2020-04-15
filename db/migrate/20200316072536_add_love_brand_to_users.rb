class AddLoveBrandToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :love_brand, :string
  end
end
