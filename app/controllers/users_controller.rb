class UsersController < ApplicationController
include DocusignHelper
helper_method :sign

  def create
    @user = User.new(user_params)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @documents = Document.all
  end

  def sign(user_id, document_id)
    @document = Document.find(document_id)
    @user = User.find(user_id)
    docusign_post_requests(@user, @document)
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
