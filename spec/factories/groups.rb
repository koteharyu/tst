FactoryBot.define do
  factory :group do
    name { Faker::Artist.name }
  end
end
