class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :name
      t.text :content
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
