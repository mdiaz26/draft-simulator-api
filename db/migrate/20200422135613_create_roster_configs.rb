class CreateRosterConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :roster_configs do |t|
      t.string :name
      t.integer :qb
      t.integer :rb
      t.integer :wr
      t.integer :te
      t.integer :def
      t.integer :k
      t.integer :rb_wr
      t.integer :wr_te
      t.integer :superflex
      t.integer :flex
      t.integer :bench

      t.timestamps
    end
  end
end
