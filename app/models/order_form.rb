class OrderForm

    include ActiveModel::Model

    attr_accessor :post_num, :prefecture_id, :city, :street_num, :building_num, :tell_num, :user_id, :item_id, :token

    with_options presence: true do
        validates :city
        validates :street_num
        validates :token
        validates :user_id
        validates :item_id
        validates :tell_num, format: { with: /\A\d{10,11}\z/, message: "is invalid. Don`t include hyphen(-)" }
        validates :post_num, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
        validates :prefecture_id, numericality: { other_than: 0 }
    end

    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, street_num: street_num, building_num: building_num, tell_num: tell_num, order_id: order.id)
    end
end