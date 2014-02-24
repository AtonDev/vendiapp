Vendiwebapp::Application.routes.draw do


  
  resources :app_subscribers, :only => [:create, :new]

  devise_for :sellers

  get "/profile",   to: 'sellers#show', :as => :profile
  get "welcome/index"

  root 'welcome#index'

  match '/about',   to: 'welcome#about_us', :as => :about_us, via: [:get]

  resources :items

end
