FactoryBot.define do
  factory :user do
    nickname {'不利魔 太郎'}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name  {'不利魔'}
    first_name {'太朗'}
    last_name_kana {'フリマ'}
    first_name_kana {'タロウ'}
    birthday {'2000-01-01'}
  end
end

