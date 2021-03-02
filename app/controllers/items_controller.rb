class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :info, :category_id, :sales_status_id, :scheduled_delivery_id,
                                 :prefecture_id, :shipping_fee_status_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
