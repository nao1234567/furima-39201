require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '正常に登録できる' do
        expect(@product).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが「---」では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_id が「---」では登録できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it 'cost_id が「---」では登録できない' do
        @product.cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Cost can't be blank")
      end

      it 'prefecture_idが「---」では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_date_id が「---」では登録できない' do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'price が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceは全角では登録できない' do
        @product.price = 'あ'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは全角数字では登録できない' do
        @product.price = '１'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは半角英字では登録できない' do
        @product.price = 'a'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは半角（カタカナ）では登録できない' do
        @product.price = 'ﾀﾛｳ'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceに半角数字以外が含まれている場合は登録できない' do
        @product.price = '１1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300円未満の場合は登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 299')
      end

      it 'priceが9_999_999円以上の場合は登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 10000000')
      end

      it 'userが紐ずいていない場合は登録できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
