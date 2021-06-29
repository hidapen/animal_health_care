require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録できる" do
    it "すべての必須情報を正しく入力すれば登録できる" do
      expect(@user).to be_valid
    end
  end
  describe "ユーザー新規登録できない" do
    it "human_last_nameが空だと登録できない" do
      @user.human_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Human last name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "human_first_nameが空だと登録できない" do
      @user.human_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Human first name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "human_last_name_rubiが空だと登録できない" do
      @user.human_last_name_rubi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Human last name rubi 全角（カタカナ）を使用してください")
    end
    it "human_first_name_rubiが空だと登録できない" do
      @user.human_first_name_rubi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Human first name rubi 全角（カタカナ）を使用してください")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "pets_nameが空では登録できない" do
      @user.pets_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets name can't be blank")
    end
    it "pets_name_rubiが空では登録できない" do
      @user.pets_name_rubi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets name rubi can't be blank")
    end
    it "pets_typeが空では登録できない" do
      @user.pets_type = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets type can't be blank")
    end
    it "pets_ageが空では登録できない" do
      @user.pets_age = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets age can't be blank")
    end
    it "human_last_name(漢字・ひらがな・カタカナ)が全角でなければ登録できない" do
      @user.human_last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Human last name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "human_first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      @user.human_first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Human first name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "human_last_name_rubiが全角カタカナでなければ登録できない" do
      @user.human_last_name_rubi = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Human last name rubi 全角（カタカナ）を使用してください")
    end
    it "human_first_name_rubiが全角カタカナでなければ登録できない" do
      @user.human_first_name_rubi = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Human first name rubi 全角（カタカナ）を使用してください")
    end
    it "emailが一意性でなければ登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "emailが@がなければ登録できない" do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '000aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英字のみだと登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角で英字と数字の両方を含めて設定してください")
    end
    it "パスワードは半角数字のみだと登録できない" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角で英字と数字の両方を含めて設定してください")
    end
    it "パスワードは全角だと登録できない" do
      @user.password = '００００００'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角で英字と数字の両方を含めて設定してください")
    end
    it "pets_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.pets_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets name 全角（漢字・ひらがな・カタカナ）を使用してください")
    end
    it "pets_name_rubiが全角カタカナでなければ登録できない" do
      @user.pets_name_rubi = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Pets name rubi 全角（カタカナ）を使用してください")
    end
  end
end
