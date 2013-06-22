class ChangeStartDate < ActiveRecord::Migration
  
  def up
    add_column :games, :date_played, :date
    remove_column :games, :start_time
  end

  def down
  end
end
