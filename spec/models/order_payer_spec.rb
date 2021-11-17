require 'rails_helper'

RSpec.describe OrderPayer, type: :model do
  before do
    @user =FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_payer = FactoryBot.build(:order_payer,user_id: @user.id,item_id: @item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_payer).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order_payer.building = ""
        expect(@order_payer).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '配送先の情報として、郵便番号が空だと保存できないこと' do
        @order_payer.postal_code = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '配送先の情報として、郵便番号がハイフン(−)を含んでいないとだと保存できないこと' do
        @order_payer.postal_code = '0010000'
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '配送先の情報として、都道府県が空だと保存できないこと' do
        @order_payer.shipping_agent_id = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Shipping agent can't be blank")
      end
      it '配送先の情報として、都道府県のIDが１だと保存できないこと' do
        @order_payer.shipping_agent_id = 1
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Shipping agent can't be blank")
      end
      it '配送先の情報として、市区町村が空だと保存できないこと' do
        @order_payer.city = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地が空だと保存できないこと' do
        @order_payer.address = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Address can't be blank")
      end
      it '配送先の情報として電話番号が空だと保存できないこと' do
        @order_payer.phone_number = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '配送先の情報として電話番号がハイフン(−)を含んでいると保存できないこと' do
        @order_payer.phone_number = '090-1234-5678'
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '配送先の情報として電話番号が12桁以上だと保存できないこと' do
        @order_payer.phone_number = '123456789012'
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-),Twelve or more')
      end
      it '電話番号が9桁以下では保存できないこと' do
        @order_payer.phone_number = '123456789'
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-),Twelve or more')
      end
      it 'tokenが空では登録できないこと' do
        @order_payer.token = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_payer.user_id = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_payer.item_id = ''
        @order_payer.valid?
        expect(@order_payer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
#bundle exec rspec spec/models/order_payer_spec.rb テストコード実行 