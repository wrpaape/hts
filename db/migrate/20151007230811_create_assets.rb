class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :key, index: true, uniqueness: true
      t.string :class_name, index: true, default: ""
      t.string :type, index: true
      t.string :description, index: true, uniqueness: true
      t.string :filename, index: true, uniqueness: true, default: ""
      t.string :path_file, index: true, uniqueness: true
      t.string :path_default, index: true, uniqueness: true
      t.string :path_link, index: true, uniqueness: true
      t.integer :parent_id, index: true
      t.string :parent_type, index: true

      t.timestamps null: false
    end

    add_index :assets, [:parent_id, :parent_type]
  end
end