class AddSiteToGames < ActiveRecord::Migration
  def change
    add_column :games, :roll_id, :integer
    add_index :games, :roll_id
  end
end
