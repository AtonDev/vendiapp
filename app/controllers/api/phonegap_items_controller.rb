class Api::PhonegapItemsController < ApplicationController

  #respond_to :json



  def add_image
    # tmpFilePath = params[:file][:tempfile].path
    #Mailer.send_pgimage(tmpFilePath)
    #render :json => params
    #return
    #img = Image.new()
    #img.photo = params[:picture]
    #if img.save
    #  render :json => {:status => "success"}
    #  return
    #else
    #  render :json => {:status => "fail"}
    #end
  end

  def add_info
    #Mailer.send_pginfo(params[:info])
    #render :json => {:status => "success"}
  end

  def pong
    render :json => "pong"
  end

end
