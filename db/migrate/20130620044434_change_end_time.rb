class ChangeEndTime < ActiveRecord::Migration

  def up
    add_column :games, :minutes_played, :integer
  end

  def down
    remove_column :games, :end_time
  end
end
