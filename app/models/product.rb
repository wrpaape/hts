class Product < ActiveRecord::Base
  include HasAllAssets

  has_many :specs, as: :parent

  def self.all_main_index
    all.map { |product| Hash[product.key, product.name] }
  end
end
