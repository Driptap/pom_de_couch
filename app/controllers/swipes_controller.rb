class SwipesController < ApplicationController
  def watch
  end

  def like
  end

  def dont_like
  end

  def watched
  end

  def info
  end

  def dash
    @user = current_user
    @show = Show.find(1)
  end
end