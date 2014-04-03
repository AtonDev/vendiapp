class Api::PhonegapItemsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => "hello word"}
    end
  end

end
