class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :key
      t.string :type
      t.string :path
      t.string :default
      t.string :parent_type
      t.integer :parent_id

      t.timestamps null: false
    end

    add_index :assets, :parent_id
  end
end
