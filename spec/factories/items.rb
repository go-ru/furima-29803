FactoryBot.define do
  factory :item do
    name              { Faker::Food.sushi }
    text              { Faker::Food.description }
    category_id       { Faker:: Number.between(from: 1, to: 10) }
    status_id         { Faker:: Number.between(from: 1, to: 6) }
    delivery_id       {Faker:: Number.between(from: 1, to: 2)}
    area_id           {Faker:: Number.between(from: 1, to: 47)}
    day_id            {Faker:: Number.between(from: 1, to: 3)}
    price             {Faker:: Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
