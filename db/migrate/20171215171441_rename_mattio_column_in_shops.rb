class RenameMattioColumnInShops < ActiveRecord::Migration[5.1]
  def change
    rename_column :shops, :mattio, :motto
  end
end
