class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :key, uniqueness: true
      t.string :name, uniqueness: true
      t.text :details, uniqueness: true

      t.timestamps null: false
    end
  end
end
