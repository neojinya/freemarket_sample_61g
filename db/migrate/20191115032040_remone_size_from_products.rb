class RemoneSizeFromProducts < ActiveRecord::Migration[5.0]
  # def up
  #   remove_column :products, :size
  #     end

  def down
    add_column :products, :size, :integer
  end
end
