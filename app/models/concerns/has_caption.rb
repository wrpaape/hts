module HasCaption
  extend ActiveSupport::Concern

  included do
    alias_attribute :caption, :description
  end
end