# == Schema Information
#
# Table name: sale_infos
#
#  created_at        :datetime
#  currently_selling :boolean
#  has_sold          :boolean
#  id                :integer          not null, primary key
#  item_id           :integer
#  price_sold        :decimal(, )
#  proposed_price    :decimal(, )
#  start_sale        :date
#  updated_at        :datetime
#

class SaleInfo < ActiveRecord::Base
	belongs_to :item
end
