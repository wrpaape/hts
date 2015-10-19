class Product < ActiveRecord::Base
  include AddPath, HasAllAssets, Searchable

  before_create :set_type_display

  has_many :specs, as: :parent

  alias_attribute :display, :name
  alias_attribute :path, :path_show

  class_attribute :category
  self.category = "products and modifications"
  self.pool_fields = [:name, :type_display, :info]

  protected

  def self.all_nav_props
    keys = [:key, :path, :display]
    pluck(*keys).map { |values| Hash[keys.zip(values)] }
  end

  private

  def add_path
    update(path_show: eval("#{type_display.fileize.singularize}_path(#{id})"))
  end

  def set_type_display
    self.type_display = category
  end
end
