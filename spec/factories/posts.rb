FactoryBot.define do
  factory :post do
    association :user

    title { Faker::Lorem.sentence }
    menu { Faker::Lorem.sentence }
    
    after(:build) do |post|
      post.image.attach(io: File.open("public/images/test-image.png"), filename: "test-image.png", content_type: "image/png")
    end
  end
end
