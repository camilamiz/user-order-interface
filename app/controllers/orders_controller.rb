class OrdersController < ApplicationController
  # def new
  #   @user = User.find(params[:user_id])
  #   @order = Order.new
  # end

  def create
    @order = Order.new(order_params)
    @order.user = User.find(params[:user_id])
    if @order.save
      respond_to do |format|
        format.html { redirect_to @order.user, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to @order.user, notice: 'Campo sem preenchimento.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
  end

  def order_params
    params.require(:order).permit(:model, :imei, :annual_price, :number_of_installments)
  end
end
