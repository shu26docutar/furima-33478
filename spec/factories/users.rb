FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password( min_length: 6 )}
    password_confirmation {password}
    first_name            {"服部"}
    last_name             {"楓平"}
    first_name_kana        {"ハットリ"}
    last_name_kana        {"シュウヘイ"}
    birthday              {"2021/01/08"}
    # id {1}
    # created_at {"2021/01/08"}
    # updated_at {"2021/01/08"}
  end
end
