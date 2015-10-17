class Employee < ActiveRecord::Base
  include AddImage, AddPath, Searchable

  has_one :location
  has_one :company, through: :location
  has_one :headshot, as: :parent, class_name: "Image"
  has_one :office_phone, as: :parent
  has_one :mobile_phone, as: :parent

  alias_attribute :name, :full_name

  self.pool_fields = [:name, :title]

  private

  def image_type
    "headshot.jpg"
  end

  def add_path
    update(path_show: member_path(id))
  end
end
