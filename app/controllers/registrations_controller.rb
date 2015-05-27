class RegistrationsController < Devise::RegistrationsController
  before_action :set_category_groups, only: [:new, :create]
  def new
    super
  end

  def create
    query_attrs = Search::Parameters.construct_parameters_from_input params
    @query = Query.new
    @query.assign_attributes query_attrs

    if @query.invalid?
      render 'new', locals: { resource: resource, resource_name: :user }
    else
      super
      if @user.valid?
        @query[:user_id] = @user.id
        @query.save
      end
    end

    #super do |resource|
    #  puts @query.invalid?
    #  if @query.invalid? or resource.invalid?
    #    render 'new' and return
    #  else
    #    @query[:user_id] = @user.id
    #    @query.save
    #  end
    #end
  end

  private
  def set_category_groups
    @category_groups = CategoryGroupReference.all
  end

  #def sign_up_params
  #  query_attrs = Search::Parameters.construct_parameters_from_input params
  #  allow = [:email, queries_attributes: [:anchor, :title, :sources, :heading, 
  #                                       :category_group, :location, :price_min, 
  #                                       :price_max, :frequency, :radius, :last_searched]]
  #  params[:queries_attributes] = query_attrs
  #  params[:email] = params[:user][:email]
  #  puts params.permit(allow)
  #  params.require(:user).permit(allow)
  #end
end
