class ChangeColumnToUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birthday, :date, null: true
    change_column :users, :num_of_exihibits, :string, null: true
  end
end
