class Member < ActiveRecord::Base
  has_many :contacts
  has_many :images, as: :parent
end
