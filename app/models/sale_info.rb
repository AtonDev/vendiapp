# == Schema Information
#
# Table name: sale_infos
#
#  id                :integer          not null, primary key
#  item_id           :integer
#  proposed_price    :decimal(, )
#  price_sold        :decimal(, )
#  start_sale        :date
#  has_sold          :boolean          default(FALSE)
#  currently_selling :boolean          default(FALSE)
#  created_at        :datetime
#  updated_at        :datetime
#

class SaleInfo < ActiveRecord::Base
	belongs_to :item
end
