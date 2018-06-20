class CreateJoinTablePersonEmail < ActiveRecord::Migration[5.2]
  def change
    create_join_table :people, :emails do |t|
      t.index [:person_id, :email_id]
      t.index [:email_id, :person_id]
    end
  end
end
