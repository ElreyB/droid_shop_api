FactoryBot.define do
  factory :location do
    galaxy Faker::Space.galaxy
    planet Faker::StarWars.planet
  end

  factory :shop do
    name Faker::Space.star + " " + Faker::Commerce.material
    owner Faker::StarWars.character
    motto Faker::StarWars.quote
    rating Faker::Number.between(1, 7)
    droid Faker::StarWars.droid
    location
  end
end
