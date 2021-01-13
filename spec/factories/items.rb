FactoryBot.define do
  factory :item do
    title           {Faker::Lorem.sentence}
    image           {Faker::Lorem.sentence}
    description     {Faker::Lorem.sentence}
    item_price      {"301"}

    association :user
    association :prefecture
    association :category
    association :status
    association :shipping_fee
    association :shipping_day
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Railsの処理の流れのコピー.png'), filename: 'test_image_png')
    end
  end
end
