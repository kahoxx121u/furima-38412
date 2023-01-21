require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      sleep 0.1
    end
  
    describe '商品出品機能' do
      context '商品出品ができるとき' do
        it '全ての項目の入力が存在すれば登録できる' do
        expect(@item).to be_valid 
        end
      end

      context '商品出品ができないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge is not a number")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day is not a number")
      end
      it 'priceが半角英数字混合では出品できない' do
        @item.prefecture_id = 'AAA0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'priceが半角英字のみでは出品できない' do
        @item.prefecture_id = 'AAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'priceが全角文字では出品できない' do
        @item.prefecture_id = '文字'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end




  end
end
end
end