FactoryBot.define do
  factory :order_payment do
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.build(:item) }
    postal_number { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end