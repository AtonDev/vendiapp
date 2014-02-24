class AppSubscribersController < ApplicationController
	def new
		@subscriber = AppSubscriber.new
	end

	def create
		subscriber = AppSubscriber.new email
		if subscriber.save
			flash.now[:success] = "You have successfuly subscribed."
		else
			flash[:error] = "Something went wrong"
			render 'new'
		end
	end

	private
		def email
			params.require(:app_subscriber).permit(:email)
		end
end
