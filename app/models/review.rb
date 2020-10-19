class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :rating, presence: true, numericality: {less_than_or_equal_to: 5.0, more_than_or_equal_to: 0.0}
  validates :description, presence: true
end
