class OrdersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  # we need `restaurant_id` to asssociate review with corresponding restaurant
    @order.user = User.find(params[:user_id])
    if @order.save
      redirect_to order_path(@user)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:model, :imei, :annual_price, :number_of_installments)
  end
end
