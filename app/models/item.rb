class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality:{ only_integer: true, with: /\A[0-9]+\z/, greater_than_or_equal_to:300,
      less_than_or_equal_to:9999999, message:"半角数字300以上9999999以下で入力して下さい" }
    validates :image
  end



  with_options presence: true, numericality: { other_than: 1, message: 'は−−以外を選択してください' }  do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_agent_id
    validates :shopping_day_id
    end

    has_one_attached :image
    belongs_to :user
    has_one :order


    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :shipping_cost
    belongs_to_active_hash :shipping_agent
    belongs_to_active_hash :shopping_day
end
