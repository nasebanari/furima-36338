class OrderPayersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]
  def index
    @order_payer = OrderPayer.new
  end

  def create
    @order_payer = OrderPayer.new(order_payer_params)
    if @order_payer.valid?
      pay_item
      @order_payer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_payer_params
    params.require(:order_payer).permit(:shipping_agent_id, :city, :address, :building, :postal_code, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user.id
  end
end

def sold_out 
  redirect_to root_path if @item.order!= nil
end

 def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_payer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
 end 



