class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :key, index: true, uniqueness: true
      t.string :title, index: true, uniqueness: true
      t.text :body, index: true, uniqueness: true
      t.string :parent_type, index: true
      t.integer :parent_id, index: true

      t.timestamps null: false
    end

    add_index :specs, [:parent_id, :parent_type]
  end
end
