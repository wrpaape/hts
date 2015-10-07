class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :key
      t.string :name
      t.string :filename
      t.text :details

      t.timestamps null: false
    end
  end
end
