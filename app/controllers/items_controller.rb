class ItemsController < ApplicationController
  def index
  end

  def items_params
    params.require(:items).permit(:name, :image).merge(user_id: current_user.id)
  end
end
