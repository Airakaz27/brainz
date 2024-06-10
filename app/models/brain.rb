class Brain < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :QI, inclusion: { in: (0..180) }
  validates :price_per_day, presence: true
  validates :languages, inclusion: { in: ["French", "English", "Italian", "Mandarin", "Spanish"] }
  validates :specialties, inclusion: { in: ["Humor", "Eloquence", "Dev Profil", "Artist Soul", "Sporty Mindset"] }
end
