module Searchable
  extend ActiveSupport::Concern
  include BuildPool

  included do
    class_attribute :pool_fields

    def self.get_pool(exclude_text)
      exclude_text ? build_pool.tap { |pool| pool[tableized].delete(:info) } : build_pool
    end
  end
end