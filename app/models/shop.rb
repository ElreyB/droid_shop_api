class Shop < ApplicationRecord
  belongs_to :Location

  validates :name, :owner, :motto, :rating, :presence => true
end
