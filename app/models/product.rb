class Product < ActiveRecord::Base
  include HasAllAssets

  has_many :specs, as: :parent
end
