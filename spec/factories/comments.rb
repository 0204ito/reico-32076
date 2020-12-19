FactoryBot.define do
  factory :comment do
    text           { 'あああ' }
    association :user
    association :refrige
  end
  
end
