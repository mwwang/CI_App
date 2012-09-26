class ProductsController < ApplicationController
  
  def index
    @products = Product.order("products.origin_id ASC")
  end
  
  def new
  end
  
  def create
  end
  
  def refresh_data
#    Product.refresh_data!('http://feeds.cardsynergy.com/datafeed/?aid=121936&v=2')
    Product.refresh_data!('cardsynergy.xml')
    redirect_to '/products'
  end
  
end
