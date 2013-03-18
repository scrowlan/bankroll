class AddStartAmoutColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :buy_in, :decimal, :precision => 10, :scale => 2
    add_column :games, :cash_out, :decimal ,:precision => 10, :scale => 2
    add_column :games, :difference, :decimal, :precision => 10, :scale => 2
    add_column :games, :start_time, :time
    add_column :games, :end_time, :time
    add_column :games, :players, :integer
  end
end
