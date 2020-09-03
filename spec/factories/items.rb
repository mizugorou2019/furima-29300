require 'faker/japanese'
FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 40) }
    description       { Faker::Lorem.characters(1000) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    category          { 2 }
    condition         { 2 }
    postage_payer     { 2 }
    shipping_origin   { 1 }
    preparation_day   { 2 }
    association :user
  end
end
