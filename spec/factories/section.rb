FactoryBot.define do
  factory :section do
    name { Faker::Name.name }
    url { Faker::Internet.url }
    # Other attributes as needed
  end
end