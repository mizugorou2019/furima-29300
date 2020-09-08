require 'faker/japanese'
FactoryBot.define do
  factory :item do
    name                 { Faker::Name.initials(number: 40) }
    description          { Faker::Lorem.characters(1000) }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id          { 2 }
    condition_id         { 2 }
    postage_payer_id     { 2 }
    shipping_origin_id   { 1 }
    preparation_day_id   { 2 }
    association :user
  end
end
