class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :key, index: true, uniqueness: true
      t.string :type, index: true
      t.boolean :primary, index: true
      t.string :info1, index: true
      t.string :info2, index: true
      t.string :info3, index: true
      t.string :info4, index: true
      t.string :parent_type, index: true
      t.integer :parent_id, index: true

      t.timestamps null: false
    end

    add_index :contacts, [:parent_id, :parent_type]
  end
end
