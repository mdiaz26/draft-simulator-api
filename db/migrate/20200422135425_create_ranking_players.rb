class CreateRankingPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :ranking_players do |t|
      t.references :player, null: false, foreign_key: true
      t.references :ranking, null: false, foreign_key: true
      t.integer :value
      t.integer :tier

      t.timestamps
    end
  end
end
