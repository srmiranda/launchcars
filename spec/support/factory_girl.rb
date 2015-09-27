require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :manufacturer do
    name "Dodge"
    country "USA"
  end

  factory :car do
    manufacturer_id 1
    color "red"
    year 2012
    mileage 75000
    description "Best car ever!"
  end
end
