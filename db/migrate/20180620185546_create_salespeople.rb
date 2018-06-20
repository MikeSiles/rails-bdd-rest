class CreateSalespeople < ActiveRecord::Migration[5.2]
  def change
    create_table :salespeople do |t|
      t.string :customers
      t.references :user, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
