class Event < ApplicationRecord
  belongs_to :game
  belongs_to :venue
  belongs_to :gender
  belongs_to :user
  has_many :users
  has_many :messages

  validates :title, presence: true
  validates :spots, presence: true
end
