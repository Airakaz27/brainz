class Review < ApplicationRecord
  belongs_to :brain

  validates :content, presence: true, length: { minimum: 5 }
end
