class Brand < ActiveRecord::Base
  has_many :assets, as: :parent
end
