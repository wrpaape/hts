class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :key, index: true, uniqueness: true
      t.string :type_display, index: true
      t.string :name, index: true, uniqueness: true
      t.string :slogan, index: true, uniqueness: true
      t.string :path_show, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
