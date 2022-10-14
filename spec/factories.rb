# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    comment { Faker::Lorem.sentence }
  end

  factory :room do
    name { 'factory_room' }
    cost { Random.rand(1..1000) }
    description { Faker::Lorem.sentence }
  end

  factory :booking do
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    start_date { (300..1000).to_a.sample.days.from_now }
    end_date { start_date + 1.day }
    room_id { 1 }
  end
end
