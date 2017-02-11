class ClientsController < ApplicationController
    def create
    @client = Client.new(client_params)
  end

  def new
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(
      :name,
      :email,
      :description
      )
  end
end
