FactoryBot.define do
  factory :item do
    product_name              { '商品名' }
    explanation               { '説明文' }
    price                     { '300' }
    category_id               { 2 }
    condition_id              { 2 }
    shipping_cost_id          { 2 }
    shipping_agent_id         { 2 }
    shopping_day_id           { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
