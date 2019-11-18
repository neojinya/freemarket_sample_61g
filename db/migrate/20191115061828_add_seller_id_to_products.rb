class AddSellerIdToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :seller_id, :integer, :null=>false
    change_column :products, :bland_id, :integer
    change_column :products, :buyer_id, :integer
  end
end
