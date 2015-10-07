class Member < ActiveRecord::Base
  has_many :contacts
  has_many :assets, as: :parent
end
