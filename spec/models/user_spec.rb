  require 'rails_helper'

  RSpec.describe User, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end

      describe 'ユーザー新規登録' do
        it "ニックネームが必須であること" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        
        end

        it "メールアドレスが必須であること" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "メールアドレスが一意性であること" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Firstname can't be blank")
        end

        it "メールアドレスは@を含む必要があること" do
          @user.email = "testgmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "パスワードが必須であること" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "パスワードは6文字以上であること" do
          @user.password = "00000"
          @user.password_confirmation ="0000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "パスワードは半角英数字混合であること" do
          @user.password = "/\A[a-zA-Z0-9]+\z/"	
          @user.valid?

        end

        it "パスワードは確認用を含めて2回入力すること" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "ユーザー本名が、名字と名前がそれぞれ必須であること" do
          @user.lastname = nil
          @user.firstname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank","Firstname can't be blank")
        end
        it " ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
          @user.lastname = "/\A[ぁ-んァ-ン一-龥]/"
          @user.firstname = "/\A[ぁ-んァ-ン一-龥]/"
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname 全角文字を使用してください","Lastname 全角文字を使用してください")
        end
        it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
          @user.lastname_kana = nil
          @user.firstname_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname kana can't be blank", "Lastname can't be blank")
        end
        it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
          @user.lastname = "/\A[ァ-ヶー－]+\z/"
          @user.firstname = "/\A[ァ-ヶー－]+\z/"
          @user.valid?
          expect(@user.errors.full_messages).to include( "Lastname 全角文字を使用してください", "Firstname 全角文字を使用してください")
        end
        it "生年月日が必須であること" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end