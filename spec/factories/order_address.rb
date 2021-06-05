FactoryBot.define do
  factory :order_address do
    item_id { Faker::Number.number(digits: 2) }
    user_id { Faker::Number.number(digits: 2) }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city { Gimei.address.city.kanji }
    address { Gimei.address.town.kanji }
    building { '建物名' }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
    order_id { Faker::Number.number(digits: 2) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
