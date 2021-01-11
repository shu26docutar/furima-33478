require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe "ユーザー新規登録" do
      context "新規登録がうまくいく場合" do
        it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid  
        end

        it "passwordが6文字以上であれば登録できること" do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          expect(@user).to be_valid  
        end
      end

    context "新規登録がうまくいかない場合" do
      
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailの@が空であれば登録ができない' do
        @user.email = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it "emailが重複すれば登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken" 
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = ""
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameとlast_nameは漢字・ひらがな・カタカナでなければ登録できない' do
        @user.first_name = "shuhei"
        @user.last_name = "hattori"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください", "Last name 全角文字を使用してください"
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'first_name_kanaとlast_name_kanaはカタカナでなければ登録できない' do
        @user.first_name_kana = "楓平"
        @user.last_name_kana = "服部"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください", "Last name kana 全角カナを使用してください"
      end

      it 'birthdayが空であれば登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
