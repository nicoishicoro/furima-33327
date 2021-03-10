class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
  end

  def new
    @order_destination = OrderDestination.new
  end
 
  def create
    @order_destination = OrderDestination.new(order_params)
     if @order_destination.valid?
       @order_destination.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
  def order_params
   params.require(:order_destination).permit(:name, :image, :nickname, :postal_code, :prefecture_id, :city, :phone_number, :building, :price)
  end
end
