class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.references :system, null:false
      t.references :block, null:false

      t.timestamps
    end
  end
end
