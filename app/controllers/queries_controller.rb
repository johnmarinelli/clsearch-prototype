class QueriesController < ApplicationController
  before_action :set_category_groups, only: [:new, :create, :edit, :update]
  
  def new
  end

  def create
    @query = Query.new query_params
    @query[:user_id] = current_user.id
    if @query.save
      redirect_to '/' and return
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @query = Query.find params[:id]
    @method = :patch
  end

  def update
    @query = Query.find params[:id]
    if @query.update query_params
      redirect_to '/' and return
    else
      @method = :patch
      render 'edit'
    end
  end

  def destroy
    @query = Query.find(params[:id])
    @query.destroy

    redirect_to '/' and return
  end

  def validate_location
    error = 'none'
    primary_location = params[:location_input].strip

    if primary_location.match(/^\d{5}$/).nil? 
      city = CityReference.find_city primary_location 
    else
      zipcode = ZipcodeReference.find_zipcode primary_location 
    end

    error = 'validate_location bad city' if city.nil? and zipcode.nil?

    render text: error
  end

  private
  def query_params
    Search::Parameters.construct_parameters_from_input(params.require(:query))
  end

  def set_category_groups
    @category_groups = CategoryGroupReference.all
    @category_groups.map { |g| g['code'] = '' if g['name'] == 'Uncategorized' }
  end

end
