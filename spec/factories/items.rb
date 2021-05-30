FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials(number: 2) }
    item_description { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id { Faker::Number.within(range: 1..10) }
    condition_id { Faker::Number.within(range: 1..7) }
    payment_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    delivery_time_id { Faker::Number.within(range: 1..3) }

    association :user

    after(:build) do |target|
      target.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
