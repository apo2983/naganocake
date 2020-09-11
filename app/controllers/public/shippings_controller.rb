class Public::ShippingsController < ApplicationController

  before_action :set_user,only: [:edit,:update,:destroy]

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
    if @shipping.update(shipping_params)
      redirect_to shippings_path,notice:"配送先を更新しました"
    else render 'edit'
    end
  end

  def destroy
    @shipping.destroy
    redirect_to shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code,:address,:name)
  end

  def set_user
    @shipping = Shipping.find(params[:id])
  end

end
