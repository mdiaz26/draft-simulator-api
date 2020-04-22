class Draft < ApplicationRecord
    has_many :franchises, dependent: :destroy
end
