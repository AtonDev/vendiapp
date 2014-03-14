class ItemsController < ApplicationController
  def index
    items = Item.where(:available => true)
    @items = items.paginate(page: params[:page], per_page: 20)
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
  	if @item.save
      flash.now[:success] = "The item was succesfully uploaded." 
      render 'show'
  	else
  		flash[:danger] = "Something went wrong"
  		render 'new'
  	end
  end

  def edit
  end

  def show
    @item = Item.find(item_id)
  end

  def update
  end

  def destroy 
  end

  def sold
    item = Item.find(item_id)
    item.sale_info.update(:has_sold => true,
                          :currently_selling => false)

    Mailer.item_sold_email(item.id, item.seller.email)

    redirect_to :back
  end


  private
  	def item_params
  		params.require(:item).permit(:title, :description, :condition, 
        :images_attributes => [:photo])
  	end

    def item_id
      params.require(:id)
    end


end
