FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"123abc"}
    password_confirmation {password}
  end
end