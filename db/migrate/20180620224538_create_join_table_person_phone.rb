class CreateJoinTablePersonPhone < ActiveRecord::Migration[5.2]
  def change
    create_join_table :people, :phones do |t|
      t.index [:person_id, :phone_id]
      t.index [:phone_id, :person_id]
    end
  end
end
