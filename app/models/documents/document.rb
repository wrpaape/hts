class Document < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  self.pool_fields = [:title, :category, :body]
end

Document.descendants.each do |desc|
  desc.pool_fields -= [:category]
  desc.top_level = false
end