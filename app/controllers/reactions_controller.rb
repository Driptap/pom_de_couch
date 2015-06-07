class ReactionsController < ApplicationController

  def new
    Reaction.create(user_id: current_user.id, show_id: session[:show_id], reaction: params[:reaction])
    get_reactions
  end

  def get_reactions
    reactions = Reaction.where(show_id: session[:show_id])    
    render :json => reactions
  end

end