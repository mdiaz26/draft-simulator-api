class CreateFranchises < ActiveRecord::Migration[6.0]
  def change
    create_table :franchises do |t|
      t.string :name
      t.integer :budget
      t.references :draft, null: false, foreign_key: true

      t.timestamps
    end
  end
end
