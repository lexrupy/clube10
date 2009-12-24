ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.root :controller => 'homes', :action => 'index'
  map.resources :sessions, :only => [:new, :create, :destroy]
  map.resources :users, :only => [:new, :create, :show]
  map.resource :home, :only => :index
  map.resources :reserves, :collection => { :court_value => :get }
  map.resources :confirmations, :only => [:new, :create, :destroy]
  map.resources :contacts, :only => [:new, :create]

end

