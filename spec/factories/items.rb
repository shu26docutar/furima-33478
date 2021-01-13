FactoryBot.define do
  factory :item do
    title           { Faker::Lorem.sentence }
    description     { Faker::Lorem.sentence }
    item_price      { 301 }
    prefecture_id   { 1 }
    shipping_fee_id { 1 }
    shipping_day_id { 1 }
    category_id     { 1 }
    status_id       { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Railsの処理の流れのコピー.png'), filename: 'test_image_png')
    end
  end
end
