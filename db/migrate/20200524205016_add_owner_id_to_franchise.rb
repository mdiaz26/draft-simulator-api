class AddOwnerIdToFranchise < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :franchises, :owners
  end
end
