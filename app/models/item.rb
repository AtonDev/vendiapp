class Item < ActiveRecord::Base
	has_and_belongs_to_many :users, join_table: :items_users

	def add_user(user_id)
		unless user_id.nil?
			user = User.find(user_id)
			unless self.users.include? user
				self.users << user
				self.save
			end
		end
	end
end
