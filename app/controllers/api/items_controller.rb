class Api::ItemsController < Api::ApiController
  before_action :authenticate

  def index
    user = User.find(params[:user_id])
    items = user.items

    render json: items 
  end

  def show
    item = Item.find(params[:id])  

    render json: item
  end

  def create
    user = User.find(params[:user_id])
    item = user.items.build(item_params)
    if item.save
      render json: item
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    render json: destroy_confirmation
  end

  def update
    item = Item.find(params[:id])
    if item.update_attributes(item_params)
      render json: item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  protected
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end