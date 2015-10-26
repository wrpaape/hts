class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def header
    { 
      pop_ups_props: {
        about_us: AboutUs.component_props,
        contact: [Company, Employee].flat_map(&:contact_content_props)
      },
      logos: Logo.order(:filename),
      nav_bar_props: nav_bar_props
    }
  end

  def nav_bar_props
    {
      nav_btns_all: [
        {
          key: "goods",
          key_head: "goods-index",
          path: products_path,
          display: "Products",
          nav_btns: Good.component_props
        },
        # {
        #   key: "mods",
        #   key_head: "mods-index",
        #   path: modifications_path,
        #   display: "Modifications",
        #   navBtns: Mod.component_props
        # }
      ],
      search_bar: {
        key: "search-bar",
        url: search_path,
        placeholder: "search everything"
      }
    }
  end
end
