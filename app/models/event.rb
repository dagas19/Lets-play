class Event < ApplicationRecord
  include PgSearch::Model
  EXPERIENCE = ["Newbie", "Beginner", "Intermidiate", "Professional"]
  belongs_to :game
  belongs_to :venue
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations
  has_many :messages

  validates :title, presence: true
  validates :spots, presence: true

  pg_search_scope :city_search,
    against: [:title], associated_against:
  { venue: [:address] }

  def participants
    [user] + users
  end
end
