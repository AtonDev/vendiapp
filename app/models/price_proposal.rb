# == Schema Information
#
# Table name: price_proposals
#
#  created_at :datetime
#  id         :integer          not null, primary key
#  item_id    :integer
#  price      :decimal(, )
#  seller_id  :integer
#  updated_at :datetime
#

class PriceProposal < ActiveRecord::Base
  validates :seller_id, uniqueness: { scope: :item_id,
    message: "You already proposed a price for this time." }

  belongs_to :item
  belongs_to :seller

end
