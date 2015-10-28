class ProductsController < ApplicationController
  def index
    @nav_bar_props = {
      navBtnsAll: [],
      searchBar: {
        key: "search-bar",
        url: product_search_path,
        placeholder: product_placeholder
      }
    }
  end
  
  private

  def product_type
    Product.descendants && params[:type].constantize 
  end

  def product_placeholder
     "search #{product_type.category.tr("/_/", " ").titleize(exclude: %w(and))}"
  end

  def product_search_path
    eval("search_#{product_type.category}_path")
  end
end
