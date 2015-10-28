class Document < ActiveRecord::Base
  include AddPath, HasAllAssets, Searchable, HasTypeDisplay, HasCategory

  belongs_to :parent, polymorphic: true

  alias_attribute :display, :title

  self.category = "documents"
  self.pool_fields = [:title, :type_display, :body]
end