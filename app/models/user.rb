class User < ActiveRecord::Base
	has_and_belongs_to_many :items, join_table: :items_users

	before_save { self.email = email.downcase }
	before_create :create_remember_token
	#Validations
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: true
	has_secure_password
	validates :password, length: { minimum: 8 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def add_item item_id
		unless item_id.nil?
			item = Item.find(item_id)
			unless self.items.include? item
				self.items << item
				self.save 
			end
		end
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end


	
end
