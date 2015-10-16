class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :key, index: true, uniqueness: true
      t.string :name, index: true, uniqueness: true
      t.text :details, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
