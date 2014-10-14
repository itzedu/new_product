require "json"
require "net/http"
require "open-uri"

class ProductsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @products = Product.all
  end

  def create
    @product = Product.create(products_params)
    uri = URI("http://localhost:8888")

    res = Net::HTTP::post_form(uri, {"name" => products_params[:name], "description" => products_params[:description]})
    render text: res
  end

  private
  def products_params
    params.require(:product).permit(:name,:description)
  end
end
