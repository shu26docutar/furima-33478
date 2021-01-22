require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe "クレカ情報の保存" do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_form).to be_valid 
    end

    it 'building_numは空でも保存できること' do
      @order_form.building_num = nil
      expect(@order_form).to be_valid
    end

    it 'tokenが空だと保存ができない' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Token can't be blank"  
    end

    it 'post_numが空だと保存できないこと' do
      @order_form.post_num = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Post num is invalid. Include hyphen(-)"
    end

    it "post_numは-がなければ保存できないこと" do
      @order_form.post_num = "1231234"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Post num is invalid. Include hyphen(-)"
    end
    

    it 'prefecture_idを選択していないと保存できないこと' do
      @order_form.prefecture_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Prefecture must be other than 0"
    end

    it 'prefecture_idが空では保存できないこと' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
    end

    it 'cityは空では保存できないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include  "City can't be blank"
    end

    it 'street_numは空では保存できないこと' do
      @order_form.street_num = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include  "Street num can't be blank"
    end

    it "tell_numは空では保存できないこと" do
      @order_form.tell_num = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Tell num can't be blank"
    end

    it "tell_numはハイフン(-)があれば登録できないこと" do
      @order_form.tell_num = "090-123-123"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include "Tell num is invalid. Do`t include hyphen(-)"
    end
  end
end
