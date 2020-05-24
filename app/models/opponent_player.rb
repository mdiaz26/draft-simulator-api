class OpponentPlayer < ApplicationRecord
  belongs_to :opponent
  belongs_to :player
end
