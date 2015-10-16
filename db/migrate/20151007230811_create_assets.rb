class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :key, uniqueness: true
      t.string :type
      t.string :filename, uniqueness: true
      t.string :path_file, uniqueness: true
      t.string :path_alt, uniqueness: true
      t.string :parent_type
      t.integer :parent_id

      t.timestamps null: false
    end

    add_index :assets, :parent_id
  end
end