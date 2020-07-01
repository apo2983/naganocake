class Admin::OrderDetailsController < ApplicationController
	
	def update
		order_detail = OrderDetail.find(params[:id])
		order_detail.update(order_detail_params)
		if params[:order_detail][:production_status] == "in_production"
			order_detail.order.status = "in_production"
			order_detail.order.save
		elsif order_detail.order.order_details.count == order_detail.order.order_details.where(production_status:"production_completed").count
			order_detail.order.status = "preparing_for_shipping"
			order_detail.order.save
		end
		redirect_back(fallback_location: admin_order_detail_path(order_detail.id))
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:production_status)
	end
end
