require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
    before do
      @order_destination = FactoryBot.build(:order_destination, user_id: 1, item_id: 1)
    end

    describe '商品購入' do
      # 商品購入についてのテストコードを記述します
      context '商品購入できるとき' do
        it 'postal_codeとprefecture_id、city、address、phone_number、token、user_id、item_idが存在すれば購入できる' do
          expect(@order_destination).to be_valid
        end
        it '郵便番号にハイフンが入っていれば購入できる' do
          @order_destination.postal_code = '123-4567'
          expect(@order_destination).to be_valid
        end
        it '電話番号が11桁以内且つ、ハイフンなしだと購入できる' do
          @order_destination.phone_number = '1234567890'
          expect(@order_destination).to be_valid
        end
        it 'buildingが空でも購入できる' do
          @order_destination.building = ''
          expect(@order_destination).to be_valid
        end
      end

      context '商品購入できないとき' do
        it '郵便番号が空だと購入できない' do
          @order_destination.postal_code = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号にハイフンが入っていないと購入できない' do
          @order_destination.postal_code = '0000000'
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Postal code is invalid.")
        end
        it 'perfecture_idが1だと購入できない' do
          @order_destination.prefecture_id = 1
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'cityが空だと購入できない' do
          @order_destination.city = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと購入できない' do
          @order_destination.address = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberが空だと購入できない' do
          @order_destination.phone_number = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが12桁以上だと購入できない' do
          @order_destination.phone_number = '123456789012'
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
        end
        it 'phone_numberが英数混合だと購入できない' do
          @order_destination.phone_number = 'aaaaa00000'
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
        end
        it 'tokenが空では登録できないこと' do
          @order_destination.token = nil
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では購入できない' do
          @order_destination.user_id = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では購入できない' do
          @order_destination.item_id = ''
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end
