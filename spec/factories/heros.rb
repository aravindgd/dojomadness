FactoryBot.define do
  factory :hero do
    name Faker::Overwatch.hero
    real_name Faker::Name.name
    health { rand(50..100) }
    armour { rand(50..100) }
    shield { rand(50..100) }
  end
end
