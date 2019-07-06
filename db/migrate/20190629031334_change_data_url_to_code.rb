class ChangeDataUrlToCode < ActiveRecord::Migration[5.2]
  def change
    change_column :codes, :url, :text
  end
end
