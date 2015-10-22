class Detail < ActiveRecord::Base
  include HasAllAssets
  belongs_to :parent, polymorphic: true
end