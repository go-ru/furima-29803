require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

  describe '商品出品' do
    context '出品がうまくいく時' do
      it '必須項目が全て存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが３００円以上なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが９９９９９９９円以内なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it '画像が指定されていなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが--を示すid値だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'status_idが空だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it 'status_idが--を示すid値だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'delivery_idが空だと出品できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery is not a number')
      end
      it 'delivery_idが--を示すid値だと出品できない' do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 0')
      end
      it 'area_idが空だと出品できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it 'area_idが--を示すid値だと出品できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it 'day_idが空だと出品できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it 'day_idが--を示すid値だと出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが２９９円以下なら出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが１０００００００円以上なら出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
