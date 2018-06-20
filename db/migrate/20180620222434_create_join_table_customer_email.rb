class CreateJoinTableCustomerEmail < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :emails do |t|
      t.index [:customer_id, :email_id]
      t.index [:email_id, :customer_id]
    end
  end
end
