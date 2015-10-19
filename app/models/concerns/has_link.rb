module HasLink
  extend ActiveSupport::Concern

  included do
    alias_attribute :link, :path_link
  end
end