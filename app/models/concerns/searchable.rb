module Searchable
  extend ActiveSupport::Concern
  include BuildPool

  included do
    class_attribute :pool_fields, :search_pool

    def self.set_pool
      self.search_pool = build_pool
    end
  end
end