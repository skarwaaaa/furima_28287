require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = build(:item)
      @item.image = fixture_file_upload('public/images/icon_b.jpg')
    end

      it "画像は1枚必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が必須であること" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が必須であること" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "商品の状態についての情報が必須であること" do
        @item.status_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "配送料の負担についての情報が必須であること" do
        @item.delivery_fee_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
        end

      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id= "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.shipping_date_id = "--"
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it " 価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "価格が、¥300以上であること" do
        @item = build(:item, price: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it "価格が、¥9,999,999以下であること" do
        @item = build(:item, price: 10000000)
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
  
      end
      it "販売価格は半角数字のみ入力可能であること" do
        @item = build(:item, price: "/\A[0-9]+\z/")
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

  end
end
