class Seed

  def self.begin
    seed = Seed.new
    seed.generate_content
  end

  def generate_content
    Location.destroy_all
    Shop.destroy_all

    100.times do |i|
      location = Location.create!(
        galaxy: Faker::Space.galaxy,
        planet: Faker::StarWars.planet
      )
      7.times do |x|
        shop = location.shops.create!(
          name: Faker::Space.star + " " + Faker::Commerce.material,
          owner: Faker::StarWars.character,
          motto: Faker::StarWars.quote,
          rating: Faker::Number.between(1, 7),
          droid: Faker::StarWars.droid
        )
      end
    end

  end
end


Seed.begin
puts "Create #{Location.count} locations."
puts "Create #{Shop.count} shops."
