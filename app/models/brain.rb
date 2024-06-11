class Brain < ApplicationRecord
  LANGUAGES = ["French", "English", "Italian", "Mandarin", "Spanish"]
  SPECIALTIES = ["Humor", "Eloquence", "Dev Profil", "Artist Soul", "Sporty Mindset"]

  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :qi, inclusion: { in: 0..180 }, numericality: { only_integer: true }
  validates :price_per_day, presence: true
  validates :languages, inclusion: { in: LANGUAGES }
  validates :specialties, inclusion: { in: SPECIALTIES }
end
