class AddLocationIdColumnToShops < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :location_id, :integer
  end
end
