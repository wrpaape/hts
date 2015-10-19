class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def header
    { 
      logos: Logo.order(:filename),
      nav_bar_props: nav_bar_props
    }
  end

  def nav_bar_props
    {
      about_us: {
          key: "about-us",
          path: products_path,
        },
      nav_btns_all: [
        {
          key: "goods",
          key_head: "goods-index",
          path: products_path,
          display: "Products",
          nav_btns: Good.all_nav_props
        },
        # {
        #   key: "mods",
        #   key_head: "mods-index",
        #   path: modifications_path,
        #   display: "Modifications",
        #   navBtns: Mod.all_nav_props
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
