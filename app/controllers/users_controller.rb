class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    items = user.items

    render json: user
  end
end
