class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :key, uniqueness: true
      t.string :name, uniqueness: true
      t.string :link, uniqueness: true

      t.timestamps null: false
    end
  end
end
