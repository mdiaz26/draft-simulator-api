class Franchise < ApplicationRecord
    belongs_to :draft
    has_many :franchise_players, dependent: :destroy
    has_many :players, through: :franchise_players
end
