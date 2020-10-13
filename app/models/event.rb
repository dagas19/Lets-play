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

  pg_search_scope :game_type_filter,
    against: [:title], associated_against:
  { game: [:name, :game_type] }

  def participants
    [user] + users
  end
end
