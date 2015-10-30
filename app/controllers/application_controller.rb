class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_header

  private

  def set_header
    @header = { 
      pop_ups_props: {
        about_us: AboutUs.component_props,
        contact: [Company, Employee].flat_map(&:contact_content_props)
      },
      logos: Logo.order(:filename),
      nav_bar_props: nav_bar_props
    }
  end
end
