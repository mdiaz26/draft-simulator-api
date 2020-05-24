class CreateOpponentPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :opponent_players do |t|
      t.references :opponent, null: false, foreign_key: true
      t.integer :salary
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
