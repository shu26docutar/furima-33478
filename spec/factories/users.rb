FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { ' 1a' +  Faker::Internet.password( min_length: 6 )}
    password_confirmation {password}
    first_name            {"服部"}
    last_name             {"楓平"}
    first_name_kana        {"ハットリ"}
    last_name_kana        {"シュウヘイ"}
    birthday              {"2021/01/08"}
  end
end
