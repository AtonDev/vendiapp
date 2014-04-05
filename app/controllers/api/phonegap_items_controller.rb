class Api::PhonegapItemsController < ApplicationController

  #respond_to :json



  def add_image
    # tmpFilePath = params[:file][:tempfile].path
    #Mailer.send_pgimage(tmpFilePath)
    #render :json => params
    #return
    img = Image.new()
    img.photo = params[:images][:image0]
    begin
       img.save!
    rescue Exception => e
       render :json => {:status => "fail", :content => e.message}
       return
    end 

    #params[:images].each do |key, value|
    #  Mailer.send_pgimage(value.path)
    #end
    render :json => {status: "success"}
  end

  def add_info
    #Mailer.send_pginfo(params[:info])
    #render :json => {:status => "success"}
    render :json => params.keys
  end

  def pong
    render :json => "pong"
  end

end
