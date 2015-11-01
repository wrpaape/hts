class Product < ActiveRecord::Base
  include HasCategory
  
  self.pool_fields = [:name, :category, :info]

  has_many :documents, as: :parent

  alias_attribute :display, :name
end