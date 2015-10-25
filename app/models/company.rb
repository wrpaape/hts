class Company < ActiveRecord::Base
  include Contactable, AddImage

  has_many :locations
  has_many :employees, through: :locations
  has_one :logo, as: :parent

  self.image_type = Logo
end
