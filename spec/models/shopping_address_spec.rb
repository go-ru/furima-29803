require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
  before do 
    seller = FactoryBot.create(:user) 
    item = FactoryBot.create(:item, user_id: seller.id)
    buyer = FactoryBot.create(:user)
    @shopping_address = FactoryBot.build(:shopping_address, item_id: item.id, user_id: buyer.id)
  end

  describe '商品購入' do
    context '商品を購入できる時' do
      it '必須項目が全て存在すれば購入できる' do
        expect(@shopping_address).to be_valid
      end
      it 'postal_codeにハイフンが含まれていれば購入できる' do
        @shopping_address.postal_code = "123-4567"
        expect(@shopping_address).to be_valid
      end
      it 'tel_numberが１１桁以内なら購入できる' do
        @shopping_address.tel_number = "1111111111"
        expect(@shopping_address).to be_valid
      end
    end

      context '商品を購入できない時' do
        it 'tokenが空の場合、購入できない' do
        @shopping_address.token = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'postal_codeが空の場合、購入できない' do
        @shopping_address.postal_code = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなかったら、購入できない' do
        @shopping_address.postal_code = "1234567"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'cityが空の場合、購入できない' do
        @shopping_address.city = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'area_idが空の場合、購入できない' do
        @shopping_address.area_id = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが--を示すid値の場合、購入できない' do
        @shopping_address.area_id = 0
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Area must be other than 0")
      end
      it 'lot_numberが空の場合、購入できない' do
        @shopping_address.lot_number = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Lot number can't be blank")
      end
      it 'tel_numberが空の場合、購入できない' do
        @shopping_address.tel_number = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが11桁以上の場合、購入できない' do
        @shopping_address.tel_number = "111111111111"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Tel number is invalid")
      end
      end
  end


end
