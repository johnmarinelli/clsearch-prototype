class RegistrationsController < Devise::RegistrationsController
  before_action :set_category_groups, only: [:new, :create]
  before_action :update_sanitized_params, if: :devise_controller?
  layout 'home', only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  private
  def set_category_groups
    @category_groups = CategoryGroupReference.all
    @category_groups.map { |g| g['code'] = '' if g['name'] == 'Uncategorized' }
  end

  def update_sanitized_params
    allowed_queries_attrs = Query.new.attributes.keys - ['_destroy', 'anchor', 'sources', 'created_at', 'updated_at', 'last_searched']

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u['queries_attributes']['0'] = Search::Parameters.construct_parameters_from_input u['queries_attributes']['0']
      u.permit :email, queries_attributes: allowed_queries_attrs
    end unless params['user'].nil? or params['user']['queries_attributes'].nil?
  end
end
