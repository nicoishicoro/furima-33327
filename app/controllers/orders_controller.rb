class OrdersController < ApplicationController
  def index
    @purchase_item = PurchaseItem.new
  end

  def new
    @purchase_item = PurchaseItem.new
  end
 
  def create
    binding.pry
    @purchase_item = PurchaseItem.new(order_params)
     if @purchase_item.valid?
       @purchase_item.save
       redirect_to action: :index
     else
       render action: :new
     end
  end
 
  private
  def order_params
   params.require(:purchase_item).permit(:name, :nickname, :postal_code, :prefecture_id, :city, :phone_number, :building, :price)
  end
end
