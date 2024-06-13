class Review < ApplicationRecord
  belongs_to :brain

  validates :comment, presence: true, length: { minimum: 5 }
  validates :rating, inclusion: { in: 1..5 }, numericality: { only_integer: true }
end
