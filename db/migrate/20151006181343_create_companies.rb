class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :key, index: true, uniqueness: true
      t.string :name, index: true, uniqueness: true
      t.string :slogan, index: true, uniqueness: true
      t.string :link, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
