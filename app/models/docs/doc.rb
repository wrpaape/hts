class Doc < ActiveRecord::Base
  include HasCategory

  belongs_to :parent, polymorphic: true

  # alias_attribute :display, :title

  self.pool_fields = [:title, :type_display, :body]
  set_attrs("docs")
end