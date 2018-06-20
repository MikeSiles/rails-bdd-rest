class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :people
      t.string :addresses
      t.string :emails
      t.string :phones

      t.timestamps
    end
  end
end
