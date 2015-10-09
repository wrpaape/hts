class ProductsController < ApplicationController

  def index
    @products = product_type.all.as_json
  end

  private

  def product_type
    Product.subclasses && params[:type].constantize 
  end
end
