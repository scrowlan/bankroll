class Game < ActiveRecord::Migration
  def up
    remove_column :games, :minutes_played
    add_column :games, :hours_played, :decimal, :precision => 5, :scale => 2
  end

  def down
  end
end
