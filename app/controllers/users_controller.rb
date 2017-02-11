class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :address,
      :first_name,
      :last_name,
      :zip_code,
      :city,
      :state
      )
  end

end
