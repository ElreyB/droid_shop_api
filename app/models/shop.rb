class Shop < ApplicationRecord
  belongs_to :location

  validates :name, :owner, :motto, :rating, :presence => true
end
