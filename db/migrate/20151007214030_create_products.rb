class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :key, index: true, uniqueness: true
      t.string :class_name, index: true
      t.string :type, index: true
      t.string :number, index: true, uniqueness: true
      t.string :name, index: true, uniqueness: true
      t.string :path_show, index: true, uniqueness: true
      t.text :info, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
