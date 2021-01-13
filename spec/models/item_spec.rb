require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "出品が上手くいくとき" do
      it 'titleとdescription・status_id・category_id・prefecture_id・shipping_day_id・shipping_fee_id・item_priceが存在すれば登録ができる' do
        expect(@item).to be_valid 
      end
    end

    context "出品が上手くいかないとき" do
      it 'imageが存在しなければ出品はできない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'titleが存在しなければ出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it 'descriptionが存在しなければ出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'status_idが存在しなければ出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end

      it '0が選択されると出品ができない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 0"
      end

      it 'category_idが存在しなければ出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '0が選択されると出品ができない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end

      it 'prefecture_idが存在しなければ出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '0が選択されると出品ができない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end

      it 'shipping_day_idが存在しなければ出品できない' do
        @item.shipping_day_id= nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end

      it '0が選択されると出品ができない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day must be other than 0"
      end

      it 'shipping_fee_idが存在しなければ出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end

      it '0が選択されると出品ができない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee must be other than 0"
      end

      it 'item_priceが存在しなければ出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not included in the list"
      end

      it 'item_priceが半角数字でなければ登録はできない' do 
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not included in the list"
      end

      it 'item_priceが300以下であれば登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not included in the list"
      end

      it 'item_priceが9_999_999以上であれば登録できない'do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not included in the list"
      end
    end
  end
end
