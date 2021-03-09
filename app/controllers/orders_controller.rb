class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def new
    @order = Order.new
  end
 
  def create
    binding.pry
    @order = Order.new(order_params)
     if @order.valid?
       @order.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
  def order_params
   params.require(:order).permit(:name, :nickname, :postal_code, :prefecture_id, :city, :phone_number, :building, :price)
  end
end
