class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :key, index: true, uniqueness: true
      t.string :name, index: true, uniqueness: true
      t.string :number, index: true, uniqueness: true
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
