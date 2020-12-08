FactoryBot.define do
  factory :user do
    nickname              { Faker::Name }
    #{Faker::Name.initials(number: 2)}イニシャル表示KIなどなので２文字。ミドルネームも入れるなら(number: 3)になる。
    email                 {Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6) + 'a3' }
    password_confirmation {password}
  end
end