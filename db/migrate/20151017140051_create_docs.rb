class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :key, index: true, uniqueness: true
      t.string :type, index: true
      t.string :type_display, index: true
      t.string :title, index: true, uniqueness: true
      t.text :body, index: true, uniqueness: true
      t.string :path_show, index: true, uniqueness: true
      t.integer :parent_id, index: true
      t.string :parent_type, index: true

      t.timestamps null: false
    end

    add_index :docs, [:parent_id, :parent_type]
  end
end
