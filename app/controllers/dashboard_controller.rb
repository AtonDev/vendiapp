require 'will_paginate/array'
class DashboardController < ApplicationController
	def show
		ordered_notifs = current_seller.notifications.order('created_at DESC')
		@notifications = ordered_notifs.paginate(page: page_params[:notifications]).per_page(5)

		ordered_proposals = current_seller.price_proposals.order('created_at DESC')
		ordered_pending_items = ordered_proposals.map{ |p| p.item }
		@pending_items = ordered_pending_items.paginate(page: page_params[:pending]).per_page(5)

		ordered_selling_items = current_seller.items.order('created_at ASC')
		@selling_items = ordered_selling_items.paginate(page: page_params[:selling]).per_page(5)

		@ledger_items = Item.limit(5).order("RANDOM()")
	end

	private 
		def page_params
			params.require(:page).permit(:notifications, :pending, :selling)
		end

end
