class AddBuyerSellerColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :buyer_id, foreign_key: { to_table: :users }
    add_reference :products, :seller_id, foreign_key: { to_table: :users }
  end
end
