class SessionsController < ApplicationController

	def welcome
	end

  def new
  	redirect_to "/auth/facebook"
  end

  def create
    @service = FacebookRegistrationService.new(request.env["omniauth.auth"])
    if @service.register!
      sign_in(@service.user)
      redirect_to sessions_pick_a_show_path
    else
      redirect_to root_path
    end
  end

  def pick_a_show

  end

  def delete
  end

  def dash
    @user = current_user
  end

  def after_show
    
  end

end
