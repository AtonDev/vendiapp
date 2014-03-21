class FeedbacksController < ApplicationController

  def submit_feedback
    feedback_params[:email] = current_seller.email if signed_in?
    Mailer.feedback_email(feedback_params)
    redirect_to :back
  end

  protected 
    def feedback_params
      params.permit(:name, :message, :email)
    end
end