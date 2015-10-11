module AddShowPath
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    after_create :add_show_path
  end
end