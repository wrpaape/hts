class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :key, uniqueness: true
      t.string :name, uniqueness: true
      t.string :path_show, uniqueness: true
      t.string :title, uniqueness: true
      t.text :bio, uniqueness: true

      t.timestamps null: false
    end
  end
end
