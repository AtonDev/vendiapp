class Mailer < ActionMailer::Base
  default from: "vendinotifications@gmail.com"

  def item_sold_email(item_id, seller_email)
  	@seller_email = seller_email
  	@item_url = "www.vendiapp.com/items/#{item_id}"
  	mail(to: "pacifico.arturo@gmail.com", subject: "An Item has SOLD!")
end
