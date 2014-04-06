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
    if params[:images]
      params[:images].each do |key, value|
        render :json => value.class.name
        return
        img = Image.new()
        begin  
          img.photo = value
          img.save!
        rescue Exception => e
          render :json => {:status => "fail", :type => "img upload and save failed", :content => e.message, :backtrace => e.backtrace}
          return
        end 
        pg_item.images<<img
      end
    else
      render :json => {:status => "fails", :contant => "no imgaes in params[:images] is empty"}
      return
    end
    begin
      pg_item.save!
      Mailer.send_item_info(pg_item.id)
    rescue Exception => e
      render :json => {:status => "fail", :type => "item save failed", :content => e.message, :backtrace => e.backtrace}
      return
    end
    
    render :json => {status: "success"}
  end
end
