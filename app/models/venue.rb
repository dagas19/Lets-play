class Venue < ApplicationRecord
  has_many :events
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
