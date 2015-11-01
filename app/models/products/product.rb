class Product < ActiveRecord::Base
  include HasCategory
  
  self.pool_fields = [:name, :category, :info]

  has_many :documents, as: :parent

  alias_attribute :display, :name
end
  
Product.descendants.each do |desc|
  desc.pool_fields -= [:category]
  desc.top_level = false
end
