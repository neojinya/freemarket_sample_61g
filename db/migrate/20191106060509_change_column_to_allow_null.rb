class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :size,:integer, null: true
  end

  def down
    change_column :products, :size,:integer, null: false
  end
end
