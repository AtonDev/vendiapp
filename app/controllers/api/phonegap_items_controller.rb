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
    params[:images].each do |key, value|
      Mailer.send_pgimage(value.path)
    end
    render :json => params
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
