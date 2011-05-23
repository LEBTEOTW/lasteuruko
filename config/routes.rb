Lasteuruko::Application.routes.draw do

  root :to => 'home#index'

  get '/join_the_destruction', :to => redirect('/join_the_destruction/twitter')
  get '/join_the_destruction/twitter/callback', :to => 'join_the_destruction#callback'
  get '/join_the_destruction/failure',          :to => 'join_the_destruction#failure'

end
