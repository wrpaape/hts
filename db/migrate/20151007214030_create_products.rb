class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :key, uniqueness: true
      t.string :type
      t.string :type_display
      t.string :name, uniqueness: true
      t.string :path_show, uniqueness: true
      t.text :info, uniqueness: true

      t.timestamps null: false
    end
  end
end
