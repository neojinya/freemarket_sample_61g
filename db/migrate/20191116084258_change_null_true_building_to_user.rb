class ChangeNullTrueBuildingToUser < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :building, :string, null:true
  end
end
