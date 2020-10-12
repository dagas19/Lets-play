class Game < ApplicationRecord
  has_many :events
  validates :name, presence: true
  validates :game_type, presence: true
  has_one_attached :photo
end
