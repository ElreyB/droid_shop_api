class Location < ApplicationRecord
  has_many :shops

  validates :planet, :galaxy, :presence => true
end
