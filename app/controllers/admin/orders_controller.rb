class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_details = @order.order_details
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	if params[:order][:status] == "payment_confirmation"
  	   order.order_details.each do |order_detail|
  	   		order_detail.production_status = "awaiting_production"
  	   		order_detail.save
  	   end
  	end
  	redirect_back(fallback_location: admin_order_path(order.id))
  end

  private
  def order_params
  	params.require(:order).permit(:status)
  end


end
