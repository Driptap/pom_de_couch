class ReactionsController < ApplicationController
  def new
    Reaction.create(user_id: current_user, show_id: sessions[:show_id], reaction: params[:reaction])
    redirect_to list_reactions
  end

  def list_reactions
    @reactions = Reaction.where(show_id: session[:show_id])    
  end
end
