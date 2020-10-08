class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :gender

  has_many :events
  has_many :registrations
  has_many :participations, through: :registrations, source: :event
  has_many :messages
end
