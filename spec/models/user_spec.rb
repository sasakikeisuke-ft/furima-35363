require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録機能などの主題' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '入力内容が適切であれば登録できる' do
      it '入力内容が全て適切であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合の6文字であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it '名前がひらがな、カタカナ、漢字ならば登録できる' do
        @user.last_name = "ひらがなカタカナ漢字"
        @user.first_name = "ひらがなカタカナ漢字"
        expect(@user).to be_valid
      end
      it '名前カナがカタカナならば登録できる' do
        @user.last_name_kana = "カタカナ"
        @user.first_name_kana = "カタカナ"
        expect(@user).to be_valid
      end
    end

    context '不適切な内容があり登録できない' do
      it 'nicknameが空欄だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空欄だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空欄だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空欄だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空欄だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空欄だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空欄だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが未入力だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'emailの重複があり登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = "ghijkl"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end


      it 'last_nameに数字が含まれていると登録できない' do
        @user.last_name += '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'last_nameに英字が含まれていると登録できない' do
        @user.last_name += 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it 'first_nameに数字が含まれていると登録できない' do
        @user.first_name += '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it 'first_nameに英字が含まれていると登録できない' do
        @user.first_name += 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      

      it 'last_name_kanaにひらがなが含まれていると登録できない' do
        @user.last_name_kana += 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaに漢字が含まれていると登録できない' do
        @user.last_name_kana += '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaに数字が含まれていると登録できない' do
        @user.last_name_kana += '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end
      it 'last_name_kanaに英字が含まれていると登録できない' do
        @user.last_name_kana += 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
      end

      it 'first_name_kanaにひらがなが含まれていると登録できない' do
        @user.first_name_kana += 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaに漢字が含まれていると登録できない' do
        @user.first_name_kana += '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaに数字が含まれていると登録できない' do
        @user.first_name_kana += '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
      it 'first_name_kanaに英字が含まれていると登録できない' do
        @user.first_name_kana += 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
      end
    end
  end
end