class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :line_1
      t.string :line_2
      t.string :city
      t.references :state, foreign_key: true
      t.references :county, foreign_key: true
      t.references :zip, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
