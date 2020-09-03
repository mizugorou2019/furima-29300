require 'faker/japanese'
gimei = Gimei.name
FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { Faker::Japanese::Name.first_name }
    family_name           { Faker::Japanese::Name.last_name }
    first_name_kana       { gimei.first.katakana }
    family_name_kana      { gimei.last.katakana }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
