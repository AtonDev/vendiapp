class SellersController < ApplicationController
	def show
	end

	def new_price_proposal
		item = Item.find(proposal_params[:item_id])
		@proposal = PriceProposal.new
		@proposal.seller = current_seller
		@proposal.item = item
		@proposal.price = proposal_params[:price]
		if @proposal.save
			flash.now[:info] = "The price proposal has been sent to the owner of '#{item.title}.'"
		else
			flash.now[:warning] = "You probably already sumbmitted a proposal for this item."
		end
		item_index
	end


	#eventually this method needs to go to the owner controller
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

		def commitment_params
			params.require(:item_id)
		end

		def proposal_params
			params.require(:proposal).permit(:item_id, :price)
		end
end
