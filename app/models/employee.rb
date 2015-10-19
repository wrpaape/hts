class Employee < ActiveRecord::Base
  include AddImage, AddPath, Searchable, Contactable

  before_create :titleize_names, :set_full_name

  has_one :location
  has_one :company, through: :location
  has_one :head_shot, as: :parent
  has_one :office_phone, as: :parent
  has_one :mobile_phone, as: :parent

  alias_attribute :name, :full_name

  self.image_type = HeadShot
  self.pool_fields = [:full_name, :title]

  private

  def titleize_names
    [first_name, middle_name, last_name].compact.each(&:titleize!)
  end

  def set_full_name
    self.full_name = [first_name, middle_name, last_name].compact.join(" ")
  end

  def add_path
    update(path_show: member_path(id))
  end
end
