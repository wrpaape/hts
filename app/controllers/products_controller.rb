class ProductsController < ApplicationController
  Product.descendants.map { |prod| Object.const_set(prod.controller, Class.new(self)) }

  def index
    # @nav_bar_props = {
    #   navBtnsAll: [],
    #   searchBar: {
    #     key: "search-bar",
    #     url: product_search_path,
    #     placeholder: product_placeholder
    #   }
    # }
  end
  
  private

  def product_type
    # Prod.descendants && params[:type].constantize
    controller_name.classify.constantize 
  end

  def product_placeholder
     "search #{product_type.category}"
  end

  def product_search_path
    send("search_#{product_type.tableized}_path")
  end

  def nav_bar_props
    {
      nav_btns_all: [],
      search_bar: {
        key: "search-bar",
        url: product_search_path,
        placeholder: product_placeholder
      }
    }
  end
end

