class Api::PhonegapItemsController < ApplicationController

  #respond_to :json
  def ping
    render :json => "pong"
  end
  


  def add_pg_item
    # tmpFilePath = params[:file][:tempfile].path
    #Mailer.send_pgimage(tmpFilePath)
    #render :json => params
    #return
    pg_item = PhonegapItem.new()
    pg_item.title = params[:title]
    pg_item.condition = params[:condition]
    pg_item.description = params[:description]
    pg_item.owners_name = params[:name]
    pg_item.owners_email = params[:email]
    params[:images].each do |key, value|
      img = Image.new()
      begin  
        img.photo = value
        img.save!
      rescue Exception => e
        render :json => {:status => "fail", :content => e.message}
        return
      end 
      pg_item.images<<img
    end
    begin
      pg_item.save!
    rescue Exception => e
      render :json => {:status => "fail", :content => e.message}
      return
    end
    Mailer.send_item_info(pg_item.id)
    render :json => {status: "success"}
  end
end
