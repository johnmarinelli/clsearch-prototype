class QueriesController < ApplicationController
  def new
    @categories = get_categories
  end

  def construct_parameters_from_input(params)
    # what
    keywords = params[:keywords]
    category = params[:category]

    # location
    primary_location = params[:location_primary]
    radius = params[:radius]

    # price
    price_min = params[:price_min]
    price_max = params[:price_max]

    params = Search::Parameters.new({
      :anchor => 0,
      :sources => { :sources => '' },
      :keywords => { :keywords => keywords },
      :category => category,
      :location => {
        :city => primary_location,
        :radius => radius
      }.to_json,
      :price_min => price_min,
      :price_max => price_max,
    })

    params.params
  end

  def create
    query = Query.new construct_parameters_from_input(params)
    query[:user_id] = current_user.id
    query.save

    redirect_to '/'
  end

  def show
  end

  def edit
    @query = Query.find(params[:id])
    @categories = get_categories
    @method = :patch
  end

  def update
    @query = Query.find(params[:id])
    
    if @query.update(query_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy

    redirect_to '/'
  end

  private
  def query_params
    construct_parameters_from_input(params)
  end
end
