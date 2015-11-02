class Product < ActiveRecord::Base
  include HasCategory

  self.db_opts = {
    display_general: [
      [:name, :path_show]
    ],
    display_text: [
      [:info, :name, :path_show]
    ]
  }

  has_many :documents, as: :parent

  alias_attribute :display, :name

  private

  def self.search_pool
    pool_fields
  end
end