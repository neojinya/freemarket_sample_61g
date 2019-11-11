class AddSellerColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :seller_id, foreign_key: { to_table: :users }, null: false
  end
end
