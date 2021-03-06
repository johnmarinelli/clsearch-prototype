class QueriesController < ApplicationController
  include CategoryGroupsSetter
  before_action :set_category_groups, only: [:new, :create, :edit, :update]
  
  def new
  end

  def create
    @query = Query.new query_params
    @query[:user_id] = current_user.id
    if @query.save
      flash[:notice] = "Successfully created #{@query.title}."
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

    flash[:notice] = "Successfully deleted #{@query.title}."
    redirect_to '/' and return
  end

  def validate_location
    error = Reference::LocationReference.validate_location params[:location_input].strip
    render text: error
  end

  private
  def query_params
    Search::Parameters.construct_parameters_from_input(params.require(:query))
  end
end
