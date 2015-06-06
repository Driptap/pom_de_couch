Rails.application.routes.draw do
  get 'reactions/upload_reaction'
  get 'reactions/list_reactions'
  
  post 'swipes/watch'
  post 'swipes/like'
  post 'swipes/dont_like'
  post 'swipes/watched'
  
  get 'swipes/info'
  get 'swipes/dash'
  get 'swipes/suggest_show'
  
  get 'sessions/welcome'
  get 'sessions/new'
  get 'sessions/delete'
  get 'sessions/pick_a_show'

  get 'auth/facebook/callback', to: 'sessions#create'

  root "sessions#welcome" 
end
