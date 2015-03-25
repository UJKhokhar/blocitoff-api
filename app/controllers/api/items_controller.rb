class Api::ItemsController < Api::ApiController
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
    item = Item.create(params.require(:item).permit(:name))
    if item.save  
      render json: item
    end
  end
end