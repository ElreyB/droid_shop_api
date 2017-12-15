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
          name: 
        )
      end
    end

  end
end


Seed.begin
