class ChangeSizeColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :size, :integer, null: true
  end
end
