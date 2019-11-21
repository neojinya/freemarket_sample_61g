class AddSellerColumnToProducts < ActiveRecord::Migration[5.0]
  def up
    add_reference :products, :seller, foreign_key: { to_table: :users },null: false
  end
end
