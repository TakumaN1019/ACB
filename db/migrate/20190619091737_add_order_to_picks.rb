class AddOrderToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :order, :integer
  end
end
