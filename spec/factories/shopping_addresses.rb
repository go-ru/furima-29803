FactoryBot.define do
  factory :shopping_address do
    token           { '00' }
    postal_code     { '123-4567' }
    area_id         {Faker:: Number.between(from: 1, to: 47)}
    city            {Faker::Address.city}
    lot_number      {Faker::Address.street_address}
    building        {Faker::Address.building_number}
    tel_number      {Faker::Number.number(digits: 11)}
    association     :user
    association     :item
  end
end
