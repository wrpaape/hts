class Member < ActiveRecord::Base
  include AddImage, AddShowPath

  has_many :contacts
  has_one :headshot, as: :parent, class_name: "Image"

  private

  def image_type
    "headshot.jpg"
  end

  def add_show_path
    update(path: member_path(id))
  end
end
