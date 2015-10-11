class Brand < ActiveRecord::Base
  include AddImage

  has_one :logo, as: :parent, class_name: "Image"

  private

  def image_type
    "logo.png"
  end
end
