class Franchise < ApplicationRecord
    belongs_to :draft
    belongs_to :opponent
    has_many :franchise_players, dependent: :destroy
    has_many :players, through: :franchise_players
end
