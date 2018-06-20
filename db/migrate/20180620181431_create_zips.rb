class CreateZips < ActiveRecord::Migration[5.2]
  def change
    create_table :zips do |t|
      t.string :code
      t.references :state, foreign_key: true
      t.timestamps
    end
  end
end
