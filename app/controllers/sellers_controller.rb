class SellersController < ApplicationController
	def show
		@seller = current_seller
	end

	def dismiss_message
		msg = Notification.find message_params[:id]
		msg.destroy()
		redirect_to:back
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

	def proposal_response
		proposal = PriceProposal.find(proposal_response_params[:proposal_id])
		msg = Notification.new
		if proposal_response_params[:verdict] == "accept"
			proposal.item.sale_info.update(	:start_sale => Date.today, 
											:currently_selling => true,
											:proposed_price => proposal)
			current_seller.items << proposal.item
			msg.content = "Your price proposal for '#{proposal.item.title}' has been accepted. You now have the right to sell this item."
			msg.save
			proposal.seller.notifications << msg
			proposal.destroy
			flash[:info] = "accept, A notification of your verdict has been sent to the seller."
			redirect_to :back
		else
			proposal.item.sale_info.update(	:start_sale => nil, 
											:currently_selling => false)
			#current_seller.items.delete(proposal.item)
			msg.content = "Your price proposal for '#{proposal.item.title}' has been rejected. This item has been added to the main ledger."
			msg.save
			proposal.seller.notifications << msg
			proposal.destroy
			flash[:info] = "A notification of your verdict has been sent to the seller."
			redirect_to :back
		end
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

		def proposal_params
			params.require(:proposal).permit(:item_id, :price)
		end

		def proposal_response_params
			params.require(:response).permit(:proposal_id, :verdict)
		end

		def message_params 
			params.require(:msg).permit(:id)
		end
end
