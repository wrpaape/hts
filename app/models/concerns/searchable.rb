module Searchable
  extend ActiveSupport::Concern
  include BuildPool

  included do
    class_attribute :pool_fields, :search_pool, :search_pool_no_text

    def self.set_pools
      self.search_pool = build_pool
      key = to_s.underscore.pluralize.to_sym
      hash = search_pool[key].except(:info)
      self.search_pool_no_text = Hash[key, hash]
    end
  end
end