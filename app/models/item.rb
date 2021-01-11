class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    # has_one :purchase

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture, :category, :status, :shipping_fee, :shipping_day

    validates :title, :description, :image, presence: true
    
    with_options numericality: { other_than: 1 } do
        validates :prefecture_id
        validates :category_id
        validates :status_id
        validates :shipping_day_id
        validates :shipping_fee_id
    end
end
