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
     "search #{product_type.category.to_s.tr("/_/", " ")}"
  end

  def product_search_path
    eval("#{product_type.category}_search_path")
  end
end
