class QueriesController < ApplicationController
  def new
    @categories = get_categories
  end

  def construct_parameters_from_input(params)
    # what
    title = params[:title]

    # assume keywords is a comma-separated list
    keywords = params[:keywords].delete(' ').split(',')
    category = params[:category]

    # location
    primary_location = params[:location_primary]
    radius = params[:radius]

    # price
    price_min = params[:price_min]
    price_max = params[:price_max]

    # anchor
    # TODO: handle timeout errors
    begin
      anchor = Search::APIPoll.get_anchor
    rescue SocketError
      Logger.fatal 'Timeout when retrieving anchor'
      anchor = nil
    end

    query_params = {
      :anchor => anchor,
      :title => title,
      :sources => Array([]),
      :keywords => Array(keywords),
      :category => category,
      :location => {
        :city => primary_location,
      }.to_json,
      :price_min => price_min,
      :price_max => price_max,
      :radius => radius,
      :last_searched => Time.now
    }
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
