require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "必須項目が全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上かつ半角英数字であれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "田中"
        expect(@user).to be_valid
      end
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "次郎"
        expect(@user).to be_valid
      end
      it "furigana_firstが全角カタカナであれば登録できる" do
        @user.furigana_first = "タナカ"
        expect(@user).to be_valid
      end
      it "furigana_lastが全角カタカナであれば登録できる " do
        @user.furigana_last = "ジロウ"
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it "Nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "Emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "Passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "Passwordが５文字以下なら登録できない" do
        @user.password = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "Passwordが半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameが全角でなければ登録できない" do
        @user.last_name = "jiro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "furigana_firstが空だと登録できない" do
        @user.furigana_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first is invalid")
      end
      it "furigana_firstが全角カタカナでなければ登録できない" do
        @user.furigana_first = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first is invalid")
      end
      it "furigana_lastが空だと登録できない" do
        @user.furigana_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last is invalid")
      end
      it "furigana_lastが全角カタカナでなければ登録できない" do
        @user.furigana_last = "じろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last is invalid")
      end
      it "Birthdayが存在しないと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    end
  end
end
