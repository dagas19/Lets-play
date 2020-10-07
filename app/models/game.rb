class Game < ApplicationRecord
  validates :name, presence: true
  validates :game_type, presence: true
end
