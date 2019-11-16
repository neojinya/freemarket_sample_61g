class AddSellerIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :seller_id, :integer, :null=>false
    add_column :products, :bland_id, :integer
    add_column :products, :buyer_id, :integer
  end
end
