class Prod < ActiveRecord::Base
  include HasCategory

  has_many :docs, as: :parent

  alias_attribute :display, :name

  self.pool_fields = [:name, :type_display, :info]
end
