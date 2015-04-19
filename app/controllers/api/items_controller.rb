class Api::ItemsController < Api::ApiController

  def index
    list = List.find(params[:list_id])
    items = list.items

    render json: items 
  end

  def show
    list = List.find(params[:list_id])
    item = list.items.find(params[:id])  

    render json: item
  end

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)
    item.user = current_user
    if item.save
      render json: item
    end
  end

  def destroy
    list = List.find(params[:list_id])
    item = list.items.find(params[:id])
    item.destroy

    render json: destroy_confirmation
  end

  def update
    list = List.find(params[:list_id])
    item = list.items.find(params[:id])
    if item.update_attributes(item_params)
      render json: item
    end
  end

  def options
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end