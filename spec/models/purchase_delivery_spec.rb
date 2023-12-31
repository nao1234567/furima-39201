require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
    describe '商品購入記録の保存' do
      before do
         @user = FactoryBot.create(:user)
         @product = FactoryBot.create(:product)
         @purchase_delivery = FactoryBot.build(:purchase_delivery,user_id: @user.id, product_id: @product.id)
      end
  
      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば購入できること' do
          expect(@purchase_delivery).to be_valid
        end
        it '建物名が空でも購入できること' do
          @purchase_delivery.building_name = ''
          expect(@purchase_delivery).to be_valid
        end
      end

      context '内容に問題がある場合' do
        it '郵便番号は空では保存できないこと' do
          @purchase_delivery.post_code = ''
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Post code can't be blank")
        end
        it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
          @purchase_delivery.post_code = '123-123４'
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it '都道府県に「---」が選択されている場合は購入できないこと' do
          @purchase_delivery.prefecture_id = '1'
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空だと購入できないこと' do
          @purchase_delivery.city = ''
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと購入できないこと' do
          @purchase_delivery.street_address = ''
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Street address can't be blank")
        end
        it '電話番号が空だと購入できないこと' do
          @purchase_delivery.phone_number = nil
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が9桁以下だと購入できないこと' do
          @purchase_delivery.phone_number = '090123456'
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
        end
        it '電話番号が12桁以上だと購入できない' do
          @purchase_delivery.phone_number = '090123456789'
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
        end
        it '電話番号が半角数値でないと購入できないこと' do
          @purchase_delivery.phone_number = '０9012341234'
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
        end
        
        it 'user_idが紐づいていなければ購入できないこと' do
          @purchase_delivery.user_id = ''
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
        end
        it 'product_idが紐づいていなければ購入できないこと' do
          @purchase_delivery.product_id = ''
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Product can't be blank")
        end

        it "tokenが空では登録できないこと" do
          @purchase_delivery.token = nil
          @purchase_delivery.valid?
          expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
        end
  
      end
  
     
    end
  
  
  



 
end
