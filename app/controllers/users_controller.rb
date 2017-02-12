class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    address = @user.address + ' ' + @user.city + ' ' + @user.state
    address = address.split(' ').join('%20')
    request = "https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV['GOOGLE_CIVIC_API_KEY']}  &address=#{address}"
    response = HTTParty.get(request)
    @user.update(civic_json: response)
    redirect_to user_path(@user)
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
