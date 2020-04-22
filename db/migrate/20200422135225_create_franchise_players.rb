class CreateFranchisePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :franchise_players do |t|
      t.references :player, null: false, foreign_key: true
      t.references :franchise, null: false, foreign_key: true
      t.integer :salary

      t.timestamps
    end
  end
end
