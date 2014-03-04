Vendiwebapp::Application.routes.draw do
	root 'welcome#index'

	devise_for :sellers
	resources :app_subscribers, :only => [:create, :new]
	resources :items

	get 'accept_response/' => 'sellers#proposal_response', :as => :proposal_response
	get 'new_proposal' => 'sellers#new_price_proposal', :as => :new_price_proposal
	get 'dismiss_message' => 'sellers#dismiss_message', :as => :dismiss_message

	get "/profile",   to: 'sellers#show', :as => :profile
	get "welcome/index"


	match '/about',   to: 'welcome#about_us', :as => :about_us, via: [:get]

end
