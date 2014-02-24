Vendiwebapp::Application.routes.draw do
	root 'welcome#index'

	devise_for :sellers
	resources :app_subscribers, :only => [:create, :new]
	resources :items

	get 'commit/' => 'sellers#commit_item', :as => :commit_item

	get "/profile",   to: 'sellers#show', :as => :profile
	get "welcome/index"


	match '/about',   to: 'welcome#about_us', :as => :about_us, via: [:get]

end
