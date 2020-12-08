FactoryBot.define do
  factory :refrige do
    refrige_name { Faker::Name }
  end

  factory :refrige_with_user do
    after(:create) do |refrige|
      create(:user, refriges: [refrige])
    end
  end
  # # Userに紐づくGroupを作成する場合
  # user = create(:user, :user_with_groups)
end
