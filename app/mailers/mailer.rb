class Mailer < ActionMailer::Base
  default from: "vendinotifications@gmail.com"

  def item_sold_email(item_id, seller_email)
  	@seller_email = seller_email
  	@item_url = "www.vendiapp.com/items/#{item_id}"
  	mail(to: "venditeam@gmail.com", cc: "pacifico.arturo@gmail.com, jasonmichealclark@gmail.com", subject: "An Item has SOLD!").deliver

  end

  def feedback_email(params)
    @name = params[:name]
    @email = params[:email]
    @content = params[:message]
    mail(to: "venditeam@gmail.com", cc: "pacifico.arturo@gmail.com, jasonmichealclark@gmail.com", subject: "Feedback on Vendi").deliver
  end
end
