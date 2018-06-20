class CreateJoinTableCustomerPhone < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :phones do |t|
       t.index [:customer_id, :phone_id]
       t.index [:phone_id, :customer_id]
    end
  end
end
