module CurrentUser
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    user_id = user.respond_to?(:id) ? user.id : user
    session[:user_id] = user_id
  end

  def sign_out
    session[:user_id] = nil
    cookies[:auth_token] = nil
  end
end