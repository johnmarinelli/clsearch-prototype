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
    # what
    keywords = params[:keywords]
    category = params[:category]

    # location
    primary_location = params[:location_primary]
    radius = params[:radius]

    # price
    price_min = params[:price_min]
    price_max = params[:price_max]

    query = Query.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :keywords => { :keywords => keywords },
      :categories => { :category => category },
      :location => {
        :city => primary_location,
        :radius => radius
      }.to_json,
      :price_min => price_min,
      :price_max => price_max,

      :user_id => current_user.id
    })

    query.save
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
    redirect_to '/'
  end
end
