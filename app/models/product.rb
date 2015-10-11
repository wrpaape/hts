class Product < ActiveRecord::Base
  include AddShowPath, HasAllAssets

  has_many :specs, as: :parent

  private

  def add_show_path
    update(path: eval("#{category.singularize}_path(#{id})"))
  end
end
