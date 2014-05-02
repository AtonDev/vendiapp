class Api::PhonegapItemsController < ApplicationController

  #respond_to :json
  def ping
    render :json => "pong"
  end
  


  def add_pg_item
    pg_item = PhonegapItem.new()
    pg_item.title = params[:title]
    pg_item.condition = params[:condition]
    pg_item.description = params[:description]
    pg_item.owners_name = params[:name]
    pg_item.owners_email = params[:email]
    latitude = params[:latitude]
    longitude = params[:longitude]
    zipcode = params[:zipcode]
    if zipcode.nil?
      zipcode = [latitude.to_f, longitude.to_f].to_zip
    end
    if params[:images]
      params[:images].each do |key, value|
        img = Image.new()
        begin  
          img.photo = value
          img.save!
        rescue Exception => e
          render :json => { :status => "fail", 
                            :type => "img upload and save failed", 
                            :content => e.message, 
                            :backtrace => e.backtrace}
          return
        end 
        pg_item.images<<img
      end
    else
      render :json => { :status => "fails", 
                        :contant => "no imgaes in params[:images] is empty"}
      return
    end
    begin
      pg_item.save!
      Mailer.send_item_info(pg_item.id, zipcode)
    rescue Exception => e
      render :json => { :status => "fail", 
                        :type => "item save failed", 
                        :content => e.message, 
                        :backtrace => e.backtrace}
      return
    end
    
    render :json => {status: "success"}
  end
end
