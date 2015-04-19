class Api::ListsController < Api::ApiController

  def index
    lists = current_user.lists
    authorize lists

    render json: lists
  end

  def show
    list = List.find(params[:id])
    authorize list

    render json: list
  end

  def create
    list = current_user.lists.build(list_params)
    authorize list
    if list.save
      render json: list
    end
  end

  def update
    list = List.find(params[:id])
    authorize list
    if list.update_attributes(list_params)
      render json: list
    end
  end

  def destroy
    list = List.find(params[:id])
    authorize list
    list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :permission, :description)
  end
end
