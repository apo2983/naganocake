class Admin::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	binding.pry
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

  private
  def item_params
  	params.require(:item).permit(:genre_id,:image,:name,:detail,:price,:is_sale)
  end
  	
end
