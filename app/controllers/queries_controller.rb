class QueriesController < ApplicationController
  def new
    # get a json list of 3taps' categories, USA zip codes
    @categories = []
  end

  def create
    redirect_to '/'
  end

  def update
  end

  def destroy
  end
end
