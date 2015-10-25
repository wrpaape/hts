class Employee < ActiveRecord::Base
  include Contactable, AddImage, AddPath, Searchable

  before_save :titleize_names, :set_full_name

  has_one :location
  has_one :company, through: :location
  has_one :head_shot, as: :parent
  has_one :office_phone, as: :parent
  has_one :mobile_phone, as: :parent

  alias_attribute :name, :full_name

  self.image_type = HeadShot
  self.pool_fields = [:full_name, :title]

  private

  def all_names
    [first_name, middle_name, last_name].compact
  end

  def titleize_names
    all_names.each(&:titleize!)
  end

  def set_full_name
    self.full_name = all_names.join(" ")
  end

  def add_path
    update(path_show: employee_path(id))
  end
end
