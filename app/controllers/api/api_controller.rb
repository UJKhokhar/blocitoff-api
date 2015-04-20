class Api::ApiController < ActionController::Base
  before_action :authenticate
  attr_reader :current_user

  # before_filter :cors_preflight_check
  # after_filter :cors_set_access_control_headers
 
  # def cors_set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  #   headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  #   headers['Access-Control-Max-Age'] = "0"
  # end
 
  # def cors_preflight_check
  #   if request.method == 'OPTIONS'
  #     headers['Access-Control-Allow-Origin'] = '*'
  #     headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  #     headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Authorization, Content-Type'
  #     headers['Access-Control-Max-Age'] = '0'
 
  #     render :text => '', :content_type => 'text/plain'
  #   end
  # end

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