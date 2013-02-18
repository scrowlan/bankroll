class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.decimal :amount, :precision => 10, :scale => 2
      t.integer :user_id

      t.timestamps
    end
#    add_index :game, [:user_id, :created_at]
  end
end
