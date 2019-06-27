class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.references :block, foreign_key: true
      t.string :name
      t.text :source
      t.text :discription
      t.string :url

      t.timestamps
    end
  end
end
