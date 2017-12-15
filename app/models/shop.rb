class Shop < ApplicationRecord
  belongs_to :location

  validates :name, :owner, :motto, :rating, :droid, :presence => true

  scope :shops_by_location, -> (location_id){ where 'location_id = ?', location_id}
  scope :search_by_name, -> (name){ where 'name = ?', name}
  scope :search_by_owner, -> (owner){ where 'owner = ?', owner}
  scope :search_by_rating, -> (rating){ where 'rating = ?', rating}
  scope :search_by_droid, -> (droid){ where 'droid = ?', droid}
end
