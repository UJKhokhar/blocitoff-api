class Api::UsersController < Api::ApiController
  skip_before_action :authenticate, :only => :create

  def show
    user = User.find(params[:id])
    
    render json: user
  end

  def create
    user = User.build(user_params)
    user.save

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:id, :auth_token)
  end

end