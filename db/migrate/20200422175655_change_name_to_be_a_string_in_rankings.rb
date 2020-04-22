class ChangeNameToBeAStringInRankings < ActiveRecord::Migration[6.0]
  def change
    change_column :rankings, :name, :string
  end
end
