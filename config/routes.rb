Vendiwebapp::Application.routes.draw do


  get "mobile/show"
  devise_for :sellers
  get "/profile",   to: 'sellers#show', :as => :profile

  get "items/index"
  get "welcome/index"

  root 'welcome#index'
  match '/items',   to: 'items#index', :as => :items, via: [:get]
  match '/about',   to: 'welcome#about_us', :as => :about_us, via: [:get]

end
