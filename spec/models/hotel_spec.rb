require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe "ホテル" do
    # context "正常" do
      it "正常: 登録" do
        hotel = FactoryBot.build(:hotel)
        expect(hotel).to be_valid
        hotel.save
        hotel1 = Hotel.find(1);
        expect(hotel1.user_id).to eq(1)
        expect(hotel1.name).to eq("TＨＥ　ＧＡＴＥ　ＨＯＴＥＬ（ザ・ゲートホテル）　東京　ｂｙ　ＨＵＬＩＣ")
        expect(hotel1.information_url).to eq("https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=168392")
        expect(hotel1.plan_list_url).to eq("https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=168392&f_flg=PLAN")
        expect(hotel1.review_count).to eq(102)
        expect(hotel1.review_average).to eq(4.73)
        expect(hotel1.review_url).to eq("https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=168392")
        expect(hotel1.postal_code).to eq("100-0006")
        expect(hotel1.address1).to eq("東京都")
        expect(hotel1.address2).to eq("千代田区有楽町2-2-3")
        expect(hotel1.telephone_no).to eq("03-6263-8233")
        expect(hotel1.parking_information).to eq("無し")
        expect(hotel1.access).to eq("銀座駅／日比谷駅より徒歩にて約１分")
        expect(hotel1.hotel_image_url).to eq("https://img.travel.rakuten.co.jp/share/HOTEL/168392/168392.jpg")
      end

      it "異常: ログインしていないユーザーはアクセスできない" do
        hotel = FactoryBot.build(:no_user_hotel)
        expect(hotel).not_to be_valid
      end
    # end
  end
end