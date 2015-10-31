class ProductsController < ApplicationController
  Product.load_other_categories.map { |prod| Object.const_set("#{prod.to_s.pluralize}Controller".to_sym, Class.new(self)) }

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
    Prod.descendants && params[:type].constantize 
  end

  def product_placeholder
     "search #{product_type.class_type_display}"
  end

  def product_search_path
    send("search_#{product_type.category}_path")
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

