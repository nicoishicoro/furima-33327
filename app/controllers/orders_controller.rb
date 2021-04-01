class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :sold, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def new
  end
 
  def create
    @order_destination = OrderDestination.new(order_params)
     if @order_destination.valid?
      pay_item
       @order_destination.save
       redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :phone_number, :building, :address).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id && @item.order == nil
      redirect_to root_path
    end
  end

  def sold
    redirect_to root_path unless @item.order == nil
  end
end
