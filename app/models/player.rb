class Player < ApplicationRecord
    has_many :franchise_players
    has_many :ranking_players
end
