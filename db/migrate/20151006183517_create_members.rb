class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :key
      t.string :name
      t.string :title
      t.text :bio

      t.timestamps null: false
    end
  end
end
