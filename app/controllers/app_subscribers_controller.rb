class AppSubscribersController < ApplicationController
	
	def show
	end

	def new
		@subscriber = AppSubscriber.new
	end

	def create
		@subscriber = AppSubscriber.new email
		if @subscriber.save
			flash.now[:success] = "You have successfuly subscribed."
			render 'show'
		else
			flash[:error] = "Something went rwong. Did you input your email incorrectly? Did you already subscribe?"
			render action: 'new'
		end
	end

	private
		def email
			params.require(:app_subscriber).permit(:email)
		end
end
