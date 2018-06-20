class CreateZips < ActiveRecord::Migration[5.2]
  def change
    change_column(:zips, :code, :string)
  end
end
