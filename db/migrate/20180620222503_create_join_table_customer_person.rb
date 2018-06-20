class CreateJoinTableCustomerPerson < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :people do |t|
      t.index [:customer_id, :person_id]
      t.index [:person_id, :customer_id]
    end
  end
end
