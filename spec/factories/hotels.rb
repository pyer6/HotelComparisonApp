FactoryBot.define do
  factory :hotel do
    user { nil }
    name { "MyString" }
    information_url { "MyText" }
    plan_list_url { "MyText" }
    review_count { 1 }
    review_average { 1.5 }
    review_url { "MyText" }
    postal_code { "MyString" }
    address1 { "MyString" }
    address2 { "MyString" }
    telephone_no { "MyString" }
    nearest_station { "MyString" }
    parking_information { "MyString" }
    access { "MyString" }
    hotel_image_url { "MyText" }
  end
end
