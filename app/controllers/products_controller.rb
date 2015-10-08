class ProductsController < ApplicationController

  private

  def product_type
    Product.subclasses && params[:type].constantize 
  end
end
