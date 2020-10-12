class Venue < ApplicationRecord
  has_many :events
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
