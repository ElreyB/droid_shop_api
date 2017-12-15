class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :owner
      t.string :mattio
      t.integer :rating
    end
  end
end
