class CategoriesController < ApplicationController

  def index
    @categories = Category.order("categories.origin_id ASC")
  end
  
    def refresh_data
  #   Category.refresh_data!('http://feeds.cardsynergy.com/datafeed/?aid=121936&v=2')
      Category.refresh_data!('cardsynergy.xml')
      redirect_to '/products'
    end
end
