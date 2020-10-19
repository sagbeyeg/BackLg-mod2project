class System < ApplicationRecord
    has_many :game_systems
    has_many :system_users
    has_many :games, through: :game_systems
    has_many :users, through: :system_users
end
