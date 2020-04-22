class FranchisePlayer < ApplicationRecord
    belongs_to :franchise
    belongs_to :player
end
