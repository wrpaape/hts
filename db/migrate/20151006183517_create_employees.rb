class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :key, index: true, uniqueness: true
      t.string :first_name, index: true
      t.string :middle_name, index: true
      t.string :last_name, index: true
      t.string :full_name, index: true
      t.string :path_show, index: true, uniqueness: true
      t.string :title, index: true, uniqueness: true
      t.text :bio, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
