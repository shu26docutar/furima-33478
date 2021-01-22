require 'payjp'

class OrdersController < ApplicationController
    
    before_action :authenticate_user!, only: :index
    before_action :set_params, only: [:index, :create]
    before_action :return_top, only: [:index, :create]

    def index 
        @order_form = OrderForm.new
    end

    def create 
        @order_form = OrderForm.new(order_params)
        if @order_form.valid?
            pay_item
            @order_form.save
            redirect_to root_path
        else
            render :index
        end
    end

    private

    def order_params
        params.require(:order_form).permit(:post_num, :prefecture_id, :city, :street_num, :building_num, :tell_num).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.item_price,
          card: params[:token],
          currency: 'jpy'
        )
    end

    def set_params
        @item = Item.find(params[:item_id])
    end

    def return_top
        if @item.order.present? || (@item.user_id == current_user.id)
            redirect_to root_path
        end
    end
end