class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @order = Item.find(params[:id])
  end

  def edit
    if @item.order.present? || @item.user_id != current_user.id
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if (@item.user_id == current_user.id) && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end