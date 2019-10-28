class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.integer :number, null: false
      t.date :expiration_date, null: false
      t.integer :security_code, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
