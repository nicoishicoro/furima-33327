class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end

  def new
  end
 
  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)
     if @order_destination.valid?
       @order_destination.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :phone_number, :building, :address).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
