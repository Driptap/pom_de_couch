class SwipesController < ApplicationController
  def watch
    Swipe.create(swipe_params, state: "watched")
    redirect_to return_suggested_show
  end

  def like
    Swipe.create(swipe_params, state: "like")
    redirect_to return_suggested_show
  end

  def dont_like
    Swipe.create(swipe_params, state: "dislike")
    redirect_to return_suggested_show
  end


  def watched
    Swipe.create(swipe_params, state: "watched")
    redirect_to return_suggested_show
  end

  def info

  end

  def dash
    @user = current_user
    @show = suggest
    session[:show] = suggest
  end

  def suggest_show
    render plain: suggest
  end

  private

  def suggest
    return Show.find(1)
  end

  def swipe_params
    params.permit(user_id: current_user.id, show_id: session[:show].id)
  end
end