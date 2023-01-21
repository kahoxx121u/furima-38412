FactoryBot.define do
  factory :item do
    association :user

    #商品出品
    item_name          { Faker::Name.name }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    text               { Faker::Lorem.sentence }
    condition_id       { Faker::Number.between(from: 2, to: 8) }
    prefecture_id      { Faker::Number.between(from: 2, to: 47) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    delivery_charge_id  { Faker::Number.between(from: 2, to: 3) }
    delivery_day_id     { Faker::Number.between(from: 2, to: 4) }
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.PNG'), filename: 'test_image.PNG')
  end
end
end
