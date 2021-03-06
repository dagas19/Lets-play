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
  validates :date, presence: true

  pg_search_scope :city_search, against: [:title], associated_against:
  { venue: [:address] }

  def participants
    [user] + users
  end

  def time_type
    if date.today?
      time_type = 'today'
    elsif date.to_date == Date.tomorrow
      time_type = 'tomorrow'
    elsif (date.to_date.cweek == Date.today.cweek) && (date.friday? || date.saturday? || date.sunday?)
      time_type = 'weekend'
    elsif date.to_date.cweek == Date.today.cweek
      time_type = 'week'
    end
    time_type
  end
end
