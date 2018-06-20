class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :addresses
      t.string :phones
      t.string :emails

      t.timestamps
    end
  end
end
