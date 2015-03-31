class Api::ListsController < Api::ApiController

  def index
    @current_user = User.find_by(auth_token: token)
    lists = @current_user.lists

    render json: lists
  end

  def show
    @current_user = User.find_by(auth_token: token)
    list = List.find(params[:id])

    render json: list
  end

  def create
    @current_user = User.find_by(auth_token: token)
    list = @current_user.lists.build(list_params)
    if list.save
      render json: list
    end
  end

  def update
    @current_user = User.find_by(auth_token: token)
    list = List.find(params[:id])
    if list.update_attributes(list_params)
      render json: list
    end
  end

  def destroy
    @current_user = User.find_by(auth_token: token)
    list = List.find(params[:id])
    list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name, :permission, :description)
  end
end
