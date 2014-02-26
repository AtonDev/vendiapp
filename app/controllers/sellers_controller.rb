class SellersController < ApplicationController
	def show
	end

	def commit_item
		item = Item.find item_id
		item.sale_info.proposed_price = price
		item.save
		current_seller.items << item
		if current_seller.save
			flash.now[:success] = "You committed to sell kart 100 for #{price} USD."
			render 'show'
		else
			flash[:warning] = "something went wrong"
			item_index
		end
	end

	def item_index
		@items = Item.all
		render :template => "items/index"
	end
	private

		def price
			params.require(:price)
		end

		def item_id
			params.require(:item_id)
		end
end
