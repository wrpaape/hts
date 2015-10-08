class Brand < ActiveRecord::Base
  include AddImage

  after_create "add_image('logo.png')"
  
  has_one :logo, as: :parent, class_name: "Image"
end
