Rails.application.routes.draw do

  post 'reactions/new'
  get 'reactions/get'
  
  get 'swipes/watch'
  get 'swipes/like'
  get 'swipes/dont_like'
  get 'swipes/watched'
  
  get 'swipes/info'
  get 'swipes/suggest_show'

  get 'sessions/remote'
  get 'sessions/after_show'  
  get 'sessions/dash'
  get 'sessions/welcome'
  get 'sessions/new'
  get 'sessions/delete'
  get 'sessions/pick_a_show'

  get 'auth/facebook/callback', to: 'sessions#create'

  root "sessions#welcome" 
end
