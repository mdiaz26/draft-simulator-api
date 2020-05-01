class AddColumnsToFranchise < ActiveRecord::Migration[6.0]
  def change
    add_column :franchises, :draft_position, :integer
    add_column :franchises, :is_nominating, :boolean
  end
end
