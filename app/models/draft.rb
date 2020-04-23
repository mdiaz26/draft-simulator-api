class Draft < ApplicationRecord
    has_many :franchises, dependent: :destroy
    belongs_to :roster_config
end
