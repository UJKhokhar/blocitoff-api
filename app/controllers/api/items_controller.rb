class Api::ItemsController < Api::ApiController
  def index
    user = User.find(params[:user_id])
    items = user.items

    render json: items
  end
end