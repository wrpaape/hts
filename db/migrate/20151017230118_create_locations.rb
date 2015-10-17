class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :key, index: true, uniqueness: true
      t.string :name, index: true
      t.belongs_to :company, index: true, foreign_key: true
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
