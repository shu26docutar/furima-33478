class ItemsController < ApplicationController

  before_action :move_to_nouser, only: [:new]

  def index
    
  end


  def new
    @prefectures = Item.order("ceated_at DESC")
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :image, :status_id, :category_id, :shipping_day_id, :shipping_fee_id, :prefecuture_id, :item_price)
  end

  def move_to_nouser
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
