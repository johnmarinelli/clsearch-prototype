class QueriesController < ApplicationController
  def new
    categories_ref = Search::APIReference.new 'categories'
    
    # get a json string of 3taps' categories, USA zip codes
    @categories = categories_ref.search

    # parse json
    @categories = JSON.parse @categories

    # retrieve categories
    @categories = @categories['categories']
  end

  def create
    keywords = params[:keywords]
    category = params[:category]
    primary_location = params[:location_primary]
    radius = params[:radius]
    price_min = params[:price_min]
    price_max = params[:price_max]
    
    redirect_to '/'
  end

  def update
  end

  def destroy
  end
end
