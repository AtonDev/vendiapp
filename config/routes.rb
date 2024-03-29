# == Route Map (Updated 2014-03-08 15:40)
#
#                     Prefix Verb   URI Pattern                         Controller#Action
#             dashboard_show GET    /dashboard/show(.:format)           dashboard#show
#                       root GET    /                                   welcome#index
#         new_seller_session GET    /sellers/sign_in(.:format)          devise/sessions#new
#             seller_session POST   /sellers/sign_in(.:format)          devise/sessions#create
#     destroy_seller_session DELETE /sellers/sign_out(.:format)         devise/sessions#destroy
#            seller_password POST   /sellers/password(.:format)         devise/passwords#create
#        new_seller_password GET    /sellers/password/new(.:format)     devise/passwords#new
#       edit_seller_password GET    /sellers/password/edit(.:format)    devise/passwords#edit
#                            PATCH  /sellers/password(.:format)         devise/passwords#update
#                            PUT    /sellers/password(.:format)         devise/passwords#update
# cancel_seller_registration GET    /sellers/cancel(.:format)           devise/registrations#cancel
#        seller_registration POST   /sellers(.:format)                  devise/registrations#create
#    new_seller_registration GET    /sellers/sign_up(.:format)          devise/registrations#new
#   edit_seller_registration GET    /sellers/edit(.:format)             devise/registrations#edit
#                            PATCH  /sellers(.:format)                  devise/registrations#update
#                            PUT    /sellers(.:format)                  devise/registrations#update
#                            DELETE /sellers(.:format)                  devise/registrations#destroy
#        seller_confirmation POST   /sellers/confirmation(.:format)     devise/confirmations#create
#    new_seller_confirmation GET    /sellers/confirmation/new(.:format) devise/confirmations#new
#                            GET    /sellers/confirmation(.:format)     devise/confirmations#show
#            app_subscribers POST   /app_subscribers(.:format)          app_subscribers#create
#         new_app_subscriber GET    /app_subscribers/new(.:format)      app_subscribers#new
#                      items GET    /items(.:format)                    items#index
#                            POST   /items(.:format)                    items#create
#                   new_item GET    /items/new(.:format)                items#new
#                  edit_item GET    /items/:id/edit(.:format)           items#edit
#                       item GET    /items/:id(.:format)                items#show
#                            PATCH  /items/:id(.:format)                items#update
#                            PUT    /items/:id(.:format)                items#update
#                            DELETE /items/:id(.:format)                items#destroy
#          proposal_response GET    /accept_response(.:format)          sellers#proposal_response
#         new_price_proposal GET    /new_proposal(.:format)             sellers#new_price_proposal
#            dismiss_message GET    /dismiss_message(.:format)          sellers#dismiss_message
#                    profile GET    /profile(.:format)                  sellers#show
#              welcome_index GET    /welcome/index(.:format)            welcome#index
#             welcome_seller GET    /welcome/seller(.:format)           welcome#seller
#                   about_us GET    /about(.:format)                    welcome#about_us
#

Vendiwebapp::Application.routes.draw do

	## Mobile API
	namespace :api do
		post 'add_item' => 'phonegap_items#add_pg_item', :as => :add_item
		get 'ping' => 'phonegap_items#ping', :as => :ping
	end




	## Site routes
	root 'welcome#index'

	devise_for :sellers, :controllers => { registrations: 'sellers/registrations' }
	devise_scope :seller do
		get 'phone_verification' => 'sellers/registrations#create', :as => :verify_phone
		get 'new_phone_verification' => 'sellers/registrations#new_phone_verification', :as => :new_phone_verification
	end
	resources :app_subscribers, :only => [:create, :new]
	resources :items

	post 'feedback' => 'feedbacks#submit_feedback', 				:as => :submit_feedback

	get 'accept_response/' => 'sellers#proposal_response',	:as => :proposal_response
	get 'new_proposal' => 'sellers#new_price_proposal', 		:as => :new_price_proposal
	get 'dismiss_message' => 'sellers#dismiss_message', 		:as => :dismiss_message
	get 'sold' => 'items#sold', 														:as => :item_sold
	get 'download_images' => 'items#download_images', 			:as => :download_images


	get "/profile",   to: 'sellers#show', 									:as => :profile
	get "welcome/index"
	get "sellers/welcome", 																	:as => :welcome_seller
	get "sellers/how_it_works", 														:as => :how_it_works

	match "/dashboard", to: 'dashboard#show', 								:as => :dashboard, via: [:get]
end
