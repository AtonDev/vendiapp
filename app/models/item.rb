class Item < ActiveRecord::Base
	belongs_to :seller
	belongs_to :owner
	has_many :images
	has_one :sale_info
	has_one :announcement

	after_save :init_sale_info

	accepts_nested_attributes_for :images, allow_destroy: true
	#def add_user(user_id)
	#	unless user_id.nil?
	#		user = User.find(user_id)
	#		unless self.users.include? user
	#			self.users << user
	#			self.save
	#		end
	#	end
	#end

	private
		def init_sale_info
			if sale_info == nil
				self.sale_info = SaleInfo.create
			end
			print "called"
		end
end
