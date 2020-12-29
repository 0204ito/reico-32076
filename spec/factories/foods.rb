FactoryBot.define do
  factory :food do
    food_name              { 'aaa' }
    product_name           { 'aaa' }
    category_id            { 2 }
    purchase_date          { '2020/10/01' }
    sell_by                { '2020/10/01' }
    shop                   { 'aaa' }
    checked                { false }
    association :refrige
  end
end
