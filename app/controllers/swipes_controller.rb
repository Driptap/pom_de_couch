class SwipesController < ApplicationController
  
  def watch
    swipe = Swipe.new
    show = Show.find(session[:show_id])
    swipe.update_attributes(user_id: current_user.id, show_id: show.id, state: "watching")
  end

  def like
    swipe = Swipe.new
    show = Show.find(session[:show_id])
    swipe.update_attributes(user_id: current_user.id, show_id: show.id, state: "like")
    suggest_show
  end

  def dont_like
    swipe = Swipe.new
    show = Show.find(session[:show_id])
    swipe.update_attributes(user_id: current_user.id, show_id: show.id, state: "dislike")
    suggest_show
  end

  def watched
    swipe = Swipe.new
    show = Show.find(session[:show_id])
    swipe.update_attributes(user_id: current_user.id, show_id: show.id, state: "watched")
    suggest_show
  end

  def info
    @show = Show.find(session[:show_id])
  end

  def suggest_show
    show = Show.order("RANDOM()").first 
    reaction = show.reactions.text.first
    show.img_link = ActionController::Base.helpers.image_url("gifs/#{show.img_link}")
    #if show.reactions.count > 0  
    #end
    session[:show_id] = show.id
    render :json => {:show => show, :reaction => reaction, :reaction_author => User.find(reaction.user_id) }
  end

end