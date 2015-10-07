class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :key
      t.string :type
      t.string :name
      t.text :info

      t.timestamps null: false
    end
  end
end
