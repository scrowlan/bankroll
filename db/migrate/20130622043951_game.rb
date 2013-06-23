class Game < ActiveRecord::Migration
  def up
    remove_column :games, :minutes_played
    add_column :games, :hours_played, :decimal, :precision => 2, :scale => 4
  end

  def down
  end
end
