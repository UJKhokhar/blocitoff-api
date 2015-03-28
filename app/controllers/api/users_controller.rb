class Api::UsersController < Api::ApiController
  before_action :authenticate

  def show
    user = User.find(params[:id])
    
    render json: user
  end

  protected
  
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end