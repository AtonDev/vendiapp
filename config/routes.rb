Vendiwebapp::Application.routes.draw do


  
  devise_for :sellers

  get "/profile",   to: 'sellers#show', :as => :profile
  get "welcome/index"
  get "mobile/show"

  root 'welcome#index'

  match '/about',   to: 'welcome#about_us', :as => :about_us, via: [:get]

  resources :items

end
