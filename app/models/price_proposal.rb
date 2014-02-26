class PriceProposal < ActiveRecord::Base
	validates :seller_id, uniqueness: { scope: :item_id,
    message: "You already proposed a price for this time." }

	belongs_to :item
	belongs_to :seller

end
