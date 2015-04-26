class QueriesController < ApplicationController
  def new
    @categories = get_category_groups
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
    @category_groups = get_category_groups
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

  def construct_parameters_from_input(params)
    # what
    title = params[:title]

    # assume keywords is a comma-separated list
    keywords = params[:keywords].delete(' ').split(',')
    category_group = params[:category]

    # location
    primary_location = params[:location_primary].strip
    
    if primary_location.match(/^\d{5}$/).nil? 
      city = CityReference.find_city primary_location 
    else
      zipcode = ZipcodeReference.find_zipcode primary_location 
    end

    radius = params[:radius]

    # price
    price_min = params[:price_min]
    price_max = params[:price_max]

    # frequency
    frequency = params[:frequency]

    # anchor
    # TODO: handle timeout errors
    #begin
    #  anchor = Search::APIPoll.get_anchor
    #rescue SocketError
    #  Logger.fatal 'Timeout when retrieving anchor'
    #  anchor = nil
    #end

    query_params = {
      :anchor => nil,
      :title => title,
      :sources => Array([]),
      :heading => Array(keywords),
      :category_group => category_group,
      :location => {
        :city => city || nil,
        :zipcode => zipcode || nil
      }.to_json,
      :price_min => price_min,
      :price_max => price_max,
      :frequency => frequency,
      :radius => radius,
      :last_searched => Time.now
    }
  end
end
