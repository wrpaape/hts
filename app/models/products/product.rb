class Product < ActiveRecord::Base
  include HasCategory

  self.search_db = {
    strings: [
      {
        field: :name
        attrs: [:path_show, :name]
      }
    ],
    texts: [
      {
        field: :info
        attrs: [:path_show, :info, :name]
      }
    ]
  }

  has_many :documents, as: :parent

  alias_attribute :display, :name

  private

  def self.search_pool
    pool_fields
  end
end