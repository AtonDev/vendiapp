class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
    @images = []
    @images << Image.new
    @images << Image.new
    @images << Image.new
  end

  def create

  	@item = Item.new(item_params)
    success = @item.save
  	if success
      #img = Image.create(item_params[:images_attributes])
      #success = img.save
      #if success
      #  @item.images << img
      #end
      #success = @item.save
      flash.now[:success] = "The item was succesfully uploaded." if success
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
  		params.require(:item).permit(:title, :description, :condition, 
        :images_attributes => [:photo])
  	end

end
