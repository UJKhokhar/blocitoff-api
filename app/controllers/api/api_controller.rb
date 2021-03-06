class Api::ApiController < ActionController::Base
  before_action :authenticate
  attr_reader :current_user
  
  protected
  
  def authenticate
    return true if request.method == 'OPTIONS'
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, option|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end

end