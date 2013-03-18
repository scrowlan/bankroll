class CreateRolls < ActiveRecord::Migration
  def change
    create_table :rolls do |t|
      t.decimal :amount, :precision => 10, :scale => 2
      t.integer :user_id

      t.timestamps
    end
#    add_index :roll, [:user_id, :created_at]
  end
end
