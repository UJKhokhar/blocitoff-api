class Api::UsersController < Api::ApiController
  before_action :authenticate

  def show
    user = User.find(params[:id])
    
    render json: user
  end

end