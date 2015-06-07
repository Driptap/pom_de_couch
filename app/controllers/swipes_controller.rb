class SwipesController < ApplicationController
  
  def watch
    swipe = Swipe.new
    show = Show.find(session[:show_id])
    swipe.update_attributes(user_id: current_user.id, show_id: show.id, state: "watched")
    suggest_show
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

  def dash
    @user = current_user
  end

  def suggest_show
    show = suggest
    session[:show_id] = show.id
    render :json => show
  end

  private

  def suggest
    return Show.find(1)
  end
end