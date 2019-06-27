class AddImageToCodes < ActiveRecord::Migration[5.2]
  def change
    add_column :codes, :image, :string
  end
end
