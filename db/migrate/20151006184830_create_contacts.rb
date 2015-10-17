class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :info, index: true, uniqueness: true
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
