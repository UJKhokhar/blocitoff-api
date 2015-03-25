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
    item = Item.create(item_params)
    creation_confirmation = "Item created."
    if item.save  
      render json: item
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    destroy_confirmation = "Item destroyed."

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
end