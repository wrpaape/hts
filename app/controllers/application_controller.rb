class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def get_header_locals
    { 
      companies: Company.includes(:logo),
      nav_bar_props: get_nav_bar_props
    }
  end

  def get_nav_bar_props
    {
      aboutUs: {
          key: "about-us",
          path: products_path,
        },
      navBtnsAll: [
        {
          key: "goods",
          keyHead: "goods-index",
          path: products_path,
          display: "Products",
          navBtns: Good.all_nav_props
        },
        # {
        #   key: "mods",
        #   keyHead: "mods-index",
        #   path: modifications_path,
        #   display: "Modifications",
        #   navBtns: Mod.all_nav_props
        # }
      ],
      searchBar: {
        key: "search-bar",
        url: search_path,
        placeholder: "search everything"
      }
    }
  end
end
