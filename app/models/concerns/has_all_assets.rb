module HasAllAssets
  extend ActiveSupport::Concern

  included do
    has_many :assets, as: :parent
    has_many :images, as: :parent
    has_many :pdfs, as: :parent
  end
end