require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
      expect(@user).to be_valid 
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが全角を含むと登録できない' do
      @user.password = 'AAAAAA'
      @user.password_confirmation = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'surname_kanjiが空では登録できない' do
      @user.surname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kanji can't be blank")
    end
    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'surname_kanaが空では登録できない' do
      @user.surname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない'do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'surname_kanjiが全角入力でなければ登録できない'do
      @user.surname_kanji = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kanji is invalid")
    end
    it 'first_name_kanjiが全角入力でなければ登録できない'do
      @user.first_name_kanji = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end
    it 'surname_kana_kanaが全角入力でなければ登録できない'do
      @user.surname_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana is invalid")
    end
    it 'first_name_kanaが全角入力でなければ登録できない'do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end
end
end