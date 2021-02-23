class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :scheduled_delivery_id, :prefecture_id, :shipping_fee_status_id).merge(user_id: current_user.id)
  end
end
