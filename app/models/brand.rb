class Brand < ActiveRecord::Base
  has_many :images, as: :parent
end
