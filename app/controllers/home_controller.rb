class HomeController < ApplicationController
  def index
    @category_groups = CategoryGroupReference.all
  end

#  def create_query_and_account
#    @query = Query.new(Search::Parameters.construct_parameters_from_input(params))
#    # TODO create a new account with email input
#    @query[:user_id] = 1
#    if @query.save
#      redirect_to '/' and return
#    else
#      render text: 'error'
#    end
#  end
end
