class Public::ShippingsController < ApplicationController
  def index
    @shipping = Shipping.new
    @shippings = current_end_user.shippings
  end

  def create
    @shipping = current_end_user.shippings.new(shipping_params)
    if @shipping.save
      redirect_to request.referer
    else 
      @shippings = current_end_user.shippings
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code,:address,:name)
  end

end
