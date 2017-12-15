class Location < ApplicationRecord
  has_many :shops

  validates :planet, :galaxy, :presence => true

  scope :search_by_galaxy, -> (galaxy){ where('galaxy = ?', galaxy)}
  scope :search_by_planet, -> (planet){ where('planet = ?', planet)}
end
