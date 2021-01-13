class ItemsController < ApplicationController

  before_action :move_to_nouser, only: [:new]

  def index
    
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end

  def move_to_nouser
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
