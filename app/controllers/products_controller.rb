class ProductsController < ApplicationController

  def index
    @products = product_type.all.as_json
    @url =
    @placeholder = "search #{}"
  end

  def search
    render json: query(ALLparams[:input])
  end

  private

  def product_type
    Product.subclasses && params[:type].constantize 
  end
end
