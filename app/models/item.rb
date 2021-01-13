class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    # has_one :purchase

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :shipping_day

    with_options presence: true do
        validates :title
        validates :description
        validates :image
    end 

    validates :item_price, presence: true,inclusion: { in: 300..9_999_999 },  format: { with: /(?=.*\d)[\d]/ , message: 'は半角英数字で入力してください'}

    with_options  presence: true ,numericality: { other_than: 0 } do
        validates :category_id
        validates :status_id
        validates :shipping_fee_id
        validates :prefecture_id
        validates :shipping_day_id
    end
end
