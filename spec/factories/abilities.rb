FactoryBot.define do
  factory :ability do
    name Faker::Name.name
    description Faker::Overwatch.quote
    is_ultimate false
    hero { create(:hero) }
  end
end
