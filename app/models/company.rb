class Company < ActiveRecord::Base
  include AddImage, Contactable

  has_many :locations
  has_many :employees, through: :locations
  has_one :logo, as: :parent, class_name: "Image"

  private

  def image_type
    "logo.png"
  end
end
