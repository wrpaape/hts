class Member < ActiveRecord::Base
  after_create :add_headshot
  has_many :contacts
  has_many :images, as: :parent

  private

  def add_headshot
    images.create(filename: "headshot.jpg")
  end
end
