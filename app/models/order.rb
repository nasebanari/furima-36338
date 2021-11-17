class Order < ApplicationRecord
  has_one :payer
  belongs_to :item
  belongs_to :user
end
