class Member < ActiveRecord::Base
  include AddImage

  after_create "add_image('headshot.jpg')"
  
  has_many :contacts
  has_one :headshot, as: :parent, class_name: "Image"
end
