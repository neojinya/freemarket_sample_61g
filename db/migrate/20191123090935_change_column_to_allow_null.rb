class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :images, :image,:text, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :images, :image,:text, null: false
  end
end
