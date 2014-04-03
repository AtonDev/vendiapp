class ItemsController < ApplicationController
  def index
    if signed_in?
      items = Item.where(:available => true)
      @items = items.paginate(page: params[:page], per_page: 12)
    else
      @items = Item.all(:conditions => ["available >= ?", true], :order => "RANDOM()", :limit => 8)
    end
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

  def download_images
    item = Item.find(item_id)
    zip_name = item.title.gsub(/\s+/, "") + ".zip"
    temp_dir = Dir.tmpdir
    zip_path = File.join(temp_dir, "#{item.title}_#{Date.today.to_s}.zip")
    Zip::OutputStream.open(zip_path) do |zos|
      item.images.each_with_index do |img, idx|
        type = img.photo.path.split(".").last
        img_name = item.title.gsub(/\s+/, "") + idx.to_s + "." + type
        zos.put_next_entry(img_name)
        zos.write Paperclip.io_adapters.for(img.photo).read 
      end
    end
    zip_data = File.read(zip_path)
    send_data(zip_data, 
              :type => 'application/zip', 
              :filename => zip_name)

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
