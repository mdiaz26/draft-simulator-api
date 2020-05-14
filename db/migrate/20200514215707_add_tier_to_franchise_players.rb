class AddTierToFranchisePlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :franchise_players, :tier, :integer
  end
end
