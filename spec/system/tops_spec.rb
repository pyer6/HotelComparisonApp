require 'rails_helper'

RSpec.describe "Tops", type: :system do
  describe "ホーム画面" do
    context "ホテル検索" do
      it "検索キーワードからホテルを検索する" do
        visit root_path
        fill_in "keyword", with: "福山"
        sleep 2
        click_button "検索"

        sleep 2
      end
    end
  end
end
