class CreateOpponents < ActiveRecord::Migration[6.0]
  def change
    create_table :opponents do |t|
      t.string :name
      t.integer :bidding_aggression
      t.integer :penalties
      t.string :team_name

      t.timestamps
    end
  end
end
