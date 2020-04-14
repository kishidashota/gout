FactoryBot.define do

  factory :user do
    user_name             {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    user_image            {"エラー.png"}
    love_brand            {"asahi"}
  end

end