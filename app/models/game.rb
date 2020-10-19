class Game < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    has_many :reviews
    has_many :users, through: :reviews
    has_many :game_systems
    has_many :systems, through: :game_systems
end
