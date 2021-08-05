FactoryBot.define do
  factory :user_jason, class: "User" do
    name {"Jason"}
    email {"jason@sample.com"}
    password {"sample"}
    password_confirmation {"sample"}
  end
end
