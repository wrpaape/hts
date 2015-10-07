class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :key
      t.string :name
      t.text :details

      t.timestamps null: false
    end
  end
end
