class SessionsController < ApplicationController
  before_action :require_user, only: %i[pick_a_show dash delete after_show]


	def welcome
    redirect_to sessions_remote_path if current_user
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
    @body_class = 'dash'
    @user = current_user
  end

  def after_show
    @body_class = 'after_show'
  end

  def remote
    @shows = []
    Swipe.watching.each do |s|
      @shows << Show.find(s.show_id)
    end
    
  end

  private
  def require_user
    redirect_to root_path if current_user.blank?
  end
end
