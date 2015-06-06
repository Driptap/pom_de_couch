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
      redirect_to swipes_dash_path
    else
      redirect_to root_path
    end
  end

  def delete
  end
end
