class AddExplanationToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :explanation, :text
    add_column :products, :delivery_date, :integer
    add_column :products, :delivery_fee_pay, :string
    add_column :products, :region, :string
  end
end
