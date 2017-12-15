class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :galaxy
      t.string :planet
    end
  end
end
