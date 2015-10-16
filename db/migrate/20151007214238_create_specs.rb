class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :key, uniqueness: true
      t.string :title, uniqueness: true
      t.text :body, uniqueness: true
      t.string :parent_type
      t.integer :parent_id

      t.timestamps null: false
    end

    add_index :specs, :parent_id
  end
end
