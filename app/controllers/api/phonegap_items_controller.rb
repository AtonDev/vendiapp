class Api::PhonegapItemsController < ApplicationController

  respond_to :json



  def add_image
    # if no id create new object
    # create new image and save it to object
    item_id = params[:id]
    unless item_id
      item_id = PhonegapItem.create().id
    end

    item = PhonegapItem.find(item_id)

    begin
      img = Image.new()
      img.photo = params[:capture]
      img.save!
      item.images << img
    rescue Exception => e
      render :json => {:status => "failed",:content => "#{e.message}"}
      return
    end
    render :json => {:status => :success, :content => item_id}
  end

  def add_info

  end


end
