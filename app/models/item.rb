class Item < ActiveRecord::Base
	belongs_to :seller
	belongs_to :owner
	has_many :images
	#def add_user(user_id)
	#	unless user_id.nil?
	#		user = User.find(user_id)
	#		unless self.users.include? user
	#			self.users << user
	#			self.save
	#		end
	#	end
	#end
end
