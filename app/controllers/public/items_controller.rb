class Public::ItemsController < ApplicationController
  def top
  end

  def index
    if Genre.find_by(name:"#{params[:genre_search]}").present?
      genre = Genre.find_by(name:"#{params[:genre_search]}")
      @items = genre.items
    else
      @items = Item.all
    end
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  end
end
