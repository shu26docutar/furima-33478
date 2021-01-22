FactoryBot.define do
  factory :order_form do
    token {ENV["PAYJP_SECRET_KEY"]}
    post_num { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street_num { 1-1 }
    building_num { 1-1 }
    tell_num {'09012341234'}
    item_id {1}
    user_id {1}
  end
end
