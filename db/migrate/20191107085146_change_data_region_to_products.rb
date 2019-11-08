class ChangeDataRegionToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :region, :integer
    change_column :products, :delivery_fee_pay, :integer
    change_column :products, :condition, :integer
  end
end
