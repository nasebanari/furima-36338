FactoryBot.define do
  factory :order_payer do
    user_id                   { 2 }
    item_id                   { 7 }
    postal_code               { '000-0001' }
    shipping_agent_id         { 2 }
    city                      { '札幌市' }
    address                   { 1 }
    building                  { 1 }
    phone_number              { '09012345678' }
    order_id                  { 1 }
    token                     {"tok_abcdefghijk00000000000000000"}
  end
end
