class Venue < ApplicationRecord
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
