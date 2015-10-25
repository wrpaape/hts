class Company < ActiveRecord::Base
  include AddImage, Contactable

  has_many :locations
  has_many :employees, through: :locations
  has_one :logo, as: :parent

  self.image_type = Logo

  private

  def self.contact_component_props
    find_by(name: "ModWerks").as_json(include: :contacts)
  end
end
