class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :key
      t.string :type
      t.string :filename
      t.string :path_file
      t.string :path_alt
      t.string :parent_type
      t.integer :parent_id

      t.timestamps null: false
    end

    add_index :assets, :parent_id
  end
end