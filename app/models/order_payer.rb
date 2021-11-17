class OrderPayer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :shipping_agent_id, :city, :explanation, :address, :building, :postal_code, :phone_number, :token, :price, :product_name, :order_id
  with_options presence: true do
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_agent_id,numericality: {other_than: 1, message: "can't be blank"}
    validates :phone_number,numericality: {with: /0\A\d{2,3}\d{1,4}\z\d{4}\z/,message:"is invalid. Input only number"}
    validates :token
  end 

  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Exclude hyphen(-),Twelve or more' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Payer.create(shipping_agent_id: shipping_agent_id, city: city, address: address, building: building, postal_code: postal_code,phone_number: phone_number, order_id: order.id)
  end
end

