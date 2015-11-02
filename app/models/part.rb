class Part < ActiveRecord::Base
  include Searchable

  belongs_to :product

  # self.pool_fields = [:name, :number, :product_id]

  self.db_opts = {
    display_labeled: [
      [:name, :number],
      [:number, :name]
    ],
  }
end
