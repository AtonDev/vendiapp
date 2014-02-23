class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		img = Image.create(image_params)
  		if img.save
  			@item.images << img
  			flash.now[:success] = "The item was successfully uploaded"
      end
  	else
  		flash[:error] = "Something went wrong"
  		render 'new'
  	end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy 
  end

  private
  	def item_params
  		params.require(:item).permit(:title, :description, :condition)
  	end

  	def image_params
  		params.require(:item).permit(:photo)
  	end
end
