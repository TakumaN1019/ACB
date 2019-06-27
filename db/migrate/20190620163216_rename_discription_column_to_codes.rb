class RenameDiscriptionColumnToCodes < ActiveRecord::Migration[5.2]
  def change
    rename_column :codes, :discription, :description
  end
end
