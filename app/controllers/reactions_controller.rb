class ReactionsController < ApplicationController

  def new
    Reaction.create(user_id: current_user.id, show_id: session[:show_id], reaction: params[:reaction])
    redirect_to list_reactions
  end

  def get_reactions
    @reactions = Reaction.where(show_id: session[:show_id])    
  end

end