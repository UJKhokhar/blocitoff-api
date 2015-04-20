class Api::UsersController < Api::ApiController
  skip_before_action :authenticate, :only => :create

  def show
    user = User.find(params[:id])
    
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save  
      head :ok
    end
  end

  private

  def user_params
    params.require(:user).permit(:auth_token)
  end

end