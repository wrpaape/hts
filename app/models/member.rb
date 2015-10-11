class Member < ActiveRecord::Base
  include AddImage, AddPath

  has_many :contacts
  has_one :headshot, as: :parent, class_name: "Image"

  private

  def image_type
    "headshot.jpg"
  end

  def add_path
    update(path_show: member_path(id))
  end
end
