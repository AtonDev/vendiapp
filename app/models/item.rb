# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  condition   :string(255)
#  description :string(255)
#  available   :boolean          default(TRUE)
#  owner_id    :integer
#  seller_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
	belongs_to :seller
	belongs_to :owner
	has_many :images, dependent: :destroy
	has_one :sale_info, dependent: :destroy
	has_many :price_proposals, dependent: :destroy
	after_save :init_sale_info
	accepts_nested_attributes_for :images, allow_destroy: true

	def self.available_conditions 
		['New', 'Used - Like New', 'Used - Good', 'Used - Acceptable']
	end



	private
		def init_sale_info
				self.create_sale_info if sale_info == nil
		end
end
