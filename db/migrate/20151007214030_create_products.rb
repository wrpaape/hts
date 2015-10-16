class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :key, index: true, uniqueness: true
      t.string :type
      t.string :type_display
      t.string :name, index: true, uniqueness: true
      t.string :path_show, index: true, uniqueness: true
      t.text :info, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
