class Ranking < ApplicationRecord
    has_many :ranking_players, dependent: :destroy
    has_many :players, through: :ranking_players
end
