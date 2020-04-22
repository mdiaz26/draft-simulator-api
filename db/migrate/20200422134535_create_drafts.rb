class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.string :name
      t.integer :roster_config_id

      t.timestamps
    end
  end
end
