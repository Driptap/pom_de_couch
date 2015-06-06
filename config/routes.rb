Rails.application.routes.draw do
  get 'reactions/upload_reaction'
  get 'reactions/list_reactions'
  
  get 'swipes/watch'
  get 'swipes/like'
  get 'swipes/dont_like'
  get 'swipes/watched'
  get 'swipes/info'
  
  get 'sessions/welcome'
  get 'sessions/new'
  get 'sessions/delete'

  root "sessions#welcome" 
end
