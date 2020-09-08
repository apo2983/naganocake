class Public::OrdersController < ApplicationController
  def new
    if current_end_user.cart_items.present?
      @order = Order.new
      @end_user = current_end_user
    else
      redirect_to cart_items_path,alert:'カートの中が空です。'
    end
  end

  def create
   order = current_end_user.orders.new(order_params)
   order.save
    current_end_user.cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.quantity = cart_item.quantity
      order_detail.price = cart_item.item.price * 1.10 
      order_detail.save
    end
    current_end_user.cart_items.destroy_all
    redirect_to orders_done_path
  end

  def confirm
    if current_end_user.cart_items.present?
      @cart_items = current_end_user.cart_items
      @order = current_end_user.orders.new(order_params)
      if params[:order][:address_option]  == "0"
        @order.address = current_end_user.address
        @order.postal_code = current_end_user.postal_code
        @order.name = current_end_user.last_name + current_end_user.first_name
      elsif params[:order][:address_option] == "1"
        shipping = Shipping.find(params[:order][:shipping])
        @order.address = shipping.address
        @order.postal_code = shipping.postal_code
        @order.name = shipping.name
      elsif params[:order][:address_option] == "2"
      end
      @sum = 0
      cart_items = current_end_user.cart_items
      cart_items.each do |cart_item|
        @sum += cart_item.item.price * 1.10 * cart_item.quantity
      end
      @sum += @order.postage
      @order.total_payment = @sum.to_i
    else
      redirect_to cart_items_path,alert:'カートの中が空です。'
    end
  end

  def done
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:total_payment)
  end
    
end
