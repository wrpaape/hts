class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :key, index: true, uniqueness: true
      t.string :name, index: true, uniqueness: true
      t.string :path_show, index: true, uniqueness: true
      t.string :title, index: true, uniqueness: true
      t.text :bio, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
