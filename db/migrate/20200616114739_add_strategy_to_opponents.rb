class AddStrategyToOpponents < ActiveRecord::Migration[6.0]
  def change
    add_column :opponents, :strategy, :integer
  end
end
