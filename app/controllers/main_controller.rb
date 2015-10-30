class MainController < ApplicationController
  def index
    @home_page_images = HomePageImage.all
	end

  private

  def nav_bar_props
    {
      nav_btns_all: [Product, Document].map(&:nav_btns_props),
      search_bar: {
        key: "search-bar",
        url: search_path,
        placeholder: "search everything"
      }
    }
  end
end
