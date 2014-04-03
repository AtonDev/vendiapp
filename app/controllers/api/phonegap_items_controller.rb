class Api::PhonegapItemsController < ApplicationController

  #respond_to :json



  def add_image
    #render :json => params.keys
    #return
    # if no id create new object
    # create new image and save it to object
    #tmpFilePath = params[:capture].tempfile.path
    #Mailer.send_pgimage(tmpFilePath)
    #item_id = params[:id]
    #unless item_id
    #  item_id = PhonegapItem.create().id
    #end

    #item = PhonegapItem.find(item_id)

    #begin
     # img = Image.new()
      #img.photo = params[:filedata]
      #img.save!
    #rescue Exception => e
    #  render :json => {:status => "failed",:content => "#{e.message}"}
    #  return
    #end
    #item.images << img
    render :json => params
  end

  def add_info

  end


end
