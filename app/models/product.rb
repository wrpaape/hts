class Product < ActiveRecord::Base
  include AddPath, HasAllAssets

  before_create :set_category

  has_many :specs, as: :parent

  alias_attribute :display, :name
  alias_attribute :path, :path_show

  protected

  def self.all_nav_props
    keys = [:key, :path, :display]
    pluck(*keys).map { |values| Hash[keys.zip(values)] }
  end

  private

  def add_path
    update(path_show: eval("#{category.singularize}_path(#{id})"))
  end
end
