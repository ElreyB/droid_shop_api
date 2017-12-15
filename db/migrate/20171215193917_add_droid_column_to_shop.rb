class AddDroidColumnToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :droid, :string
  end
end
