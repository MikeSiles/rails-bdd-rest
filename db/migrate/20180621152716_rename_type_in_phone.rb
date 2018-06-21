class RenameTypeInPhone < ActiveRecord::Migration[5.2]
  def change
    rename_column :phones, :type, :line_type
  end
end
