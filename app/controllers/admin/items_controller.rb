class Admin::ItemsController < ApplicationController
  def index
  	if params[:name].present?
  		if Item.where(name:params[:name]).present?
  			@items = Item.where("name LIKE ?","%#{params[:name]}%")
  		else
  		@items = Item.none
  		flash[:alert] = "#{params[:name]}という商品はありません。"
  		end
  	else
  		@items = Item.all
  	end
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  	   redirect_to admin_item_path(@item.id)
  	else render 'admin/items/new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  end

  def search
  	item = Item.search(params[:search])
  end

  private
  def item_params
  	params.require(:item).permit(:genre_id,:image,:name,:detail,:price,:is_sale)
  end
  	
end
