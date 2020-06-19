class Public::CartItemsController < ApplicationController
  def index
  	@cart_items = current_end_user.cart_items
  end

  def update
  	cart_item = CartItem.find(params[:id])
  	cart_item.update(params.require(:cart_item).permit(:quantity))
  	redirect_to cart_items_path,notice:'数量を変更しました。'
  end

  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy
  	flash[:notice] = "カートを削除しました。"
  	redirect_back(fallback_location: cart_items_path)
  end

  def destroy_all
  	cart_items = CartItem.all
  	cart_items.destroy_all
  	redirect_back(fallback_location: cart_items_path)
  	flash[:notice] = "カートを空にしました。"
  end

  def create
  	if current_end_user.cart_items.find_by(item_id:params[:item_id]).present?
	  	   cart_item = current_end_user.cart_items.find_by(item_id:params[:item_id])
	  	   cart_item.update(cart_item_params) #require(:cart_item)をいれるとなぜかエラーになる。
  		   redirect_to cart_items_path
  	else
  		item = Item.find(params[:item_id])
  		cart_item = current_end_user.cart_items.new(cart_item_params) #require(:cart_item)をいれるとなぜかエラーになる。
  		cart_item.item_id = item.id
  		if cart_item.save
  	   		redirect_to cart_items_path,notice:'カートに追加しました。'
  		else render 'public/items/show'
  		end
  	end
  end

  private
  def cart_item_params
  	params.permit(:quantity)
  end
  	
end
