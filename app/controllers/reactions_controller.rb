class ReactionsController < ApplicationController

  def new
    reaction = Reaction.new(user_id: current_user.id, show_id: session[:show_id], reaction: params[:reaction])
    reaction.save
    render :json => reaction
  end

  def get
    reactions = Reaction.where(show_id: session[:show_id])    
    render :json => reactions
  end

end