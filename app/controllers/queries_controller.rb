class QueriesController < ApplicationController
  def new
    @categories = get_category_groups
  end

  def create
    query = Query.new(Query.construct_parameters_from_input(params))
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

  def validate_location
    error = 'none'
    primary_location = params[:location_input].strip

    if primary_location.match(/^\d{5}$/).nil? 
      city = CityReference.find_city primary_location 
    else
      zipcode = ZipcodeReference.find_zipcode primary_location 
    end

    error = 'bad city' if city.nil? and zipcode.nil?

    render text: error
  end

  private
  def query_params
    Query.construct_parameters_from_input(params)
  end
end
