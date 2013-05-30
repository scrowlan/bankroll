class AddSiteToRolls < ActiveRecord::Migration
  def change
    add_column :rolls, :site_name, :string
  end
end
