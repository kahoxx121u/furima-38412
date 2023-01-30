require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @order_payment = FactoryBot.build(:order_payment)
  end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_payment).to be_valid
      end
      it '建物名が空の場合でも保存できる' do
        @order_payment.building_name = nil
        expect(@order_payment).to be_valid
      end
    end
      
    context '内容に問題がある場合' do
      it 'user_idが空だと保存できない' do
        @order_payment.user_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_payment.item_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_payment.postal_number = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Postal number can't be blank", 'Postal number is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_payment.postal_number = 1_234_567
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Postal number is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_payment.prefecture_id = 1
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_payment.prefecture_id = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_payment.city = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_payment.address = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_payment.telephone_number = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_payment.telephone_number = '123 - 1234 - 1234'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_payment.telephone_number = 12_345_678_910_123_111
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が9桁以下であると保存できないこと' do
        @order_payment.telephone_number = 12_345_678
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end