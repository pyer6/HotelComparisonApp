require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー" do
    context "登録" do
      it "正しく登録できること" do
        user = FactoryBot.build(:user_jason)
        expect(user).to be_valid
        user.save
        user1 = User.find(1);
        expect(user1.name).to eq("Jason")
        expect(user1.email).to eq("jason@sample.com")
        expect(user1.valid_password?("sample")).to eq(true)
      end

      it "必須項目が未入力だと登録できない" do
        user = User.new
        expect(user).not_to be_valid
        expect(user.errors[:name]).to include("が入力されていません。")
        expect(user.errors[:email]).to include("が入力されていません。")
        expect(user.errors[:password]).to include("が入力されていません。")
        expect(user.errors[:password_confirmation]).to include("が入力されていません。")
      end

      it "登録済みのメールでは登録はできない" do
        user = FactoryBot.build(:user_jason)
        user.save
        user1 = FactoryBot.build(:user_jason)
        expect(user1).not_to be_valid
        expect(user1.errors[:email]).to include("は既に使用されています。")
      end

      it "パスワードが6文字以内だと登録できない" do
        user = FactoryBot.build(:user_jason, password: "sam", password_confirmation: "sam")
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end

      it "パスワードとパスワード確認が同一でないと登録できない" do
        user = FactoryBot.build(:user_jason, password_confirmation: "samsam")
        expect(user).not_to be_valid
        expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
      end
    end
  end
end
