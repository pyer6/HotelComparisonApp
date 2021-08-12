FactoryBot.define do
  factory :hotel do
    name {"TＨＥ　ＧＡＴＥ　ＨＯＴＥＬ（ザ・ゲートホテル）　東京　ｂｙ　ＨＵＬＩＣ"}
    information_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=168392"}
    plan_list_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=168392&f_flg=PLAN"}
    review_count {102}
    review_average {4.73}
    review_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=168392"}
    postal_code {"100-0006"}
    address1 {"東京都"}
    address2 {"千代田区有楽町2-2-3"}
    telephone_no {"03-6263-8233"}
    parking_information {"無し"}
    access {"銀座駅／日比谷駅より徒歩にて約１分"}
    hotel_image_url {"https://img.travel.rakuten.co.jp/share/HOTEL/168392/168392.jpg"}
    hotel_no {168392}
    hotel_min_charge {7612}
    association :user, factory: :user_jason
  end

  factory :no_user_hotel, class: "Hotel" do
    name {"TＨＥ　ＧＡＴＥ　ＨＯＴＥＬ（ザ・ゲートホテル）　東京　ｂｙ　ＨＵＬＩＣ"}
    information_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/JBe8h/?f_no=168392"}
    plan_list_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/3VTwt/?f_no=168392&f_flg=PLAN"}
    review_count {102}
    review_average {4.73}
    review_url {"https://img.travel.rakuten.co.jp/image/tr/api/kw/HTX0u/?f_hotel_no=168392"}
    postal_code {"100-0006"}
    address1 {"東京都"}
    address2 {"千代田区有楽町2-2-3"}
    telephone_no {"03-6263-8233"}
    parking_information {"無し"}
    access {"銀座駅／日比谷駅より徒歩にて約１分"}
    hotel_image_url {"https://img.travel.rakuten.co.jp/share/HOTEL/168392/168392.jpg"}
    hotel_no {168392}
    hotel_min_charge {7612}
  end
end
