class Shop < ApplicationRecord
  belongs_to :location

  validates :name, :owner, :motto, :rating, :droid, :presence => true
end
