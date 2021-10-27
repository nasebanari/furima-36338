require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品登録' do
  context '商品出品登録がうまくいくとき' do
    it 'product_name,explanation,price,category_id,condition_id,shipping_cost_id,shipping_agent_id,shopping_day_id が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品登録がうまくいかないとき' do
    it '画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が空だと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーが1だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態が空だと登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '商品の状態が1だと登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料が空だと登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not a number")
    end
    it '配送料が1だと登録できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it '配送元の地域が空だと登録できない' do
      @item.shipping_agent_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping agent is not a number")
    end
    it '配送元の地域が1だと登録できない' do
      @item.shipping_agent_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping agent must be other than 1")
    end
    it '発送までの日数が空だと登録できない' do
      @item.shopping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping day is not a number")
    end
    it '発送までの日数が1だと登録できない' do
      @item.shopping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping day must be other than 1")
    end
    it '価格が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格範囲が300未満は登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 半角数字300以上9999999以下で入力して下さい")
    end
    it '価格範囲が9,999,999より大きいと登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 半角数字300以上9999999以下で入力して下さい")
    end
    it '価格は半角数字でないければ登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 半角数字300以上9999999以下で入力して下さい") 
     end
    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end