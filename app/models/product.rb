class Product < ActiveRecord::Base
  has_many :assets, as: :parent
  has_many :images, as: :parent
  has_many :pdfs, as: :parent
  has_many :specs, as: :parent
end
