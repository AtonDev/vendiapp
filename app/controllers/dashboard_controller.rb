class DashboardController < ApplicationController
	def show

		ordered_notifs = current_seller.notifications.order('created_at ASC')
		@notifications = ordered_notifs.paginate(page: params[:notifications_page], per_page: 5)

		ordered_proposals = current_seller.price_proposals.order('created_at DESC')
		@pending_proposals = ordered_proposals.paginate(page: params[:pending_page], per_page: 5)

    
		ordered_selling_items = current_seller.items.select {|item| item.sale_info.has_sold == false }.sort_by{|item| item.created_at}
		@selling_items = ordered_selling_items.paginate(page: params[:selling_page], per_page: 5)

		@ledger_items = Item.all(:conditions => ["available >= ?", true], :order => "RANDOM()", :limit => 5)
	end
end
