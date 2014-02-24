class AppSubscriber < ActiveRecord::Base
	before_save {|app_subscriber| app_subscriber.email = app_subscriber.email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
end
