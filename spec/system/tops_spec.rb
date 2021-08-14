require 'rails_helper'

RSpec.describe "Tops", type: :system do
  describe "ホーム画面" do
    context "ホテル検索" do
      it "検索キーワードからホテルを検索する" do
        visit root_path
        expect(current_path).to eq root_path
        click_link "ログイン"
        expect(current_path).to eq new_user_session_path
        click_link "新規登録"
        expect(current_path).to eq new_user_registration_path
        fill_in "user[name]", with: "test"
        fill_in "user[email]", with: "test@sample.com"
        fill_in "user[password]", with: "sample"
        fill_in "user[password_confirmation]", with: "sample"
        click_button "登録"
        expect(page).to have_content "アカウント登録が完了しました。"
  
        sleep 1
        click_link "ログアウト"
        click_link "ログイン"
        fill_in "user[email]", with: "test@sample.com"
        fill_in "user[password]", with: "sample"
        click_button "ログイン"
        expect(page).to have_content "ログインしました。"
  
        fill_in "keyword", with: "松江"
        click_button "検索"
        first(".no-bookmark").click
        page.all(".no-bookmark")[1].click
        page.all(".no-bookmark")[2].click
        
        click_link "ブックマーク"
        expect(current_path).to eq hotels_path
        sleep 3

        click_link "マップへ"
        sleep 3

        click_link "ブックマーク"
        sleep 1
        first(".bookmark").click
        sleep 1
        
        click_link "ブックマーク"
        expect(current_path).to eq hotels_path
        sleep 2
  
      end
    end
  end
end
