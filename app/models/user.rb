class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

        validates :nickname, presence: true
        validates :password, presence: true, length: { minimum:6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ , message: 'は半角英数字で入力してください'}
        validates :birthday, presence: true
end
# /\A[a-z0-9]{1}/
# /\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/
# https://gyazo.com/bea9aa41966eaf97c166622484a9a22b 新規失敗
# https://gyazo.com/6c946b97c2a2bf2ecce4e1b8fb07377e　新規成功
# https://gyazo.com/fc2a51851fd68cdb2e9eda0528c9d2fd　ログアウト
# https://gyazo.com/626c17a0ab78bdda927487f1a72159b6　ログイン失敗
# https://gyazo.com/11d58ce9e4ccfe27944a0d154747aafa ログイン成功
# https://gyazo.com/b4fdf469201eeae70260616af256e783 テスト写真