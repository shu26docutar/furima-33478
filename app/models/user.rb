class User < ApplicationRecord
        devise  :database_authenticatable, :registerable,
                :recoverable, :rememberable, :validatable

        has_many :items
        has_many :purchase

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :last_name
        end

        with_options presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: '全角カナを使用してください' } do
          validates :first_name_kana
          validates :last_name_kana
        end

        with_options presence: true do
          validates :nickname
          validates :birthday
        end
        
        validates :password, presence: true, length: { minimum:6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ , message: 'は半角英数字で入力してください'}
end