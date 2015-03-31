class ListsController < ApplicationController

  def index
    lists = @current_user.lists

    render json: lists
  end

  def show
    list = List.find(params[:id])

    render json: list
  end

  def create
    list = @current_user.lists.build(list_params)
    if list.save
      render json: list
    end
  end

  def update
    list = List.find(params[:id])
    if list.update_attributes(list_params)
      render json: list
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :permission, :description)
  end
end
