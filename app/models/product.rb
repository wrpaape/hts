class Product < ActiveRecord::Base
  include AddPath, HasAllAssets

  before_create :set_category

  has_many :specs, as: :parent

  private

  def add_path
    update(path_show: eval("#{category.singularize}_path(#{id})"))
  end
end
