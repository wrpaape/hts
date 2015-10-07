class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :key
      t.string :name
      t.string :filename
      t.string :link

      t.timestamps null: false
    end
  end
end
