class ItemsController < ApplicationController
    def index
        
    end

  def new
    # @item = Item.new
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
    params.require(:item).permit(:title, :description, :image, :status_id, :category_id, :shipping_day_id, :shipping_fee_id, :prifecture_id, :item_price)
  end
end
