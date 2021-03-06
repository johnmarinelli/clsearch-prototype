class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show 
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end
end
