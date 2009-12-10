ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.root :controller => 'homes', :action => 'index'
  map.resources :sessions
  map.resources :users
  map.resource :home
  map.resources :reserves, :collection => { :court_value => :get }
  map.resources :confirmations

end

