require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item =FactoryBot.build(:item)
    end

      it "ログインしているユーザーだけが、出品ページへ遷移できること" do
        expect(current_path).to eq new_item_path 
      end

      it "画像は1枚必須であること" do
        @item = build(:item, image: "")
        binding.pry
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が必須であること" do
        @item = build(:item, name: "")
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が必須であること" do
      @item = build(:item, description: "")
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item = build(:item, category_id: "--")
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "商品の状態についての情報が必須であること" do
        @item = build(:item, status_id: "--")
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end

      it "配送料の負担についての情報が必須であること" do
        @item = build(:item, delivery_fee_id: "--")
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
        end

      it "発送元の地域についての情報が必須であること" do
        @item = build(:item, prefecture_id: "--")
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it "発送までの日数についての情報が必須であること" do
        @item = build(:item, shipping_date_id: "--")
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end

      it " 価格についての情報が必須であること" do
        @item = build(:item, price: "")
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が、¥300以上であること" do
        @item = build(:item, price: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "価格が、¥9,999,999以下であること" do
        @item = build(:item, price: 10000000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
  
      end
      it "販売価格は半角数字のみ入力可能であること" do
        @item = build(:item, price: "/\A[0-9]+\z/")
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end

  end
end
