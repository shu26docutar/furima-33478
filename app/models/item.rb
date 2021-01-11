class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    # has_one :purchase

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to  :category, :status, :shipping_fee, :prefecture, :shipping_day

    with_options presence: true do
        validates :title
        validates :description
        validates :image
        validates :item_price
    end

    with_options  presence: true ,numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :shipping_fee_id
        validates :prefecture_id
        validates :shipping_day_id
    end
end
