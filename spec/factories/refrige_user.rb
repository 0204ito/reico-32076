FactoryBot.define do
  factory :refrige_user do
    association :user
    association :refrige
    #↑の記述でuserとrefrigeのインスタンスも同時に生成
  end
end