module AddPath
  extend ActiveSupport::Concern

  included do
    after_create :add_path
  end
end