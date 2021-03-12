require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end

    describe '商品購入' do
      # 商品購入についてのテストコードを記述します
      context '商品購入できるとき' do
        it 'postal_codeとprefecture_id、city、address、phone_numberが存在すれば購入できる' do
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
          @order_destination.phone_number = '000000000000'
          @order_destination.valid?
          expect(@order_destination.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end
      end
    end
end
