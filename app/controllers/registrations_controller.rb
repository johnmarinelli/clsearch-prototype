class RegistrationsController < Devise::RegistrationsController
  def new
    @category_groups = CategoryGroupReference.all
    super
  end

  def create
    @category_groups = CategoryGroupReference.all
    @query = Query.new(Search::Parameters.construct_parameters_from_input(params))
    @query[:user_id] = nil
    
    if @query.valid?
      super
      @query[:user_id] = @user.id
      @query.save
    else
      render 'new'
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource || User.new 
  end

  def users_url
    # TODO
    # have this show flash message when user registers
    '/'
  end

end
