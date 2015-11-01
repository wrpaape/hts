class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  self.pool_fields = [:title, :category, :body]
end