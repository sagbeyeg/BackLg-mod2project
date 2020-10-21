class User < ApplicationRecord
    has_many :reviews
    has_many :games, through: :reviews
    has_many :system_users
    has_many :systems, through: :system_users

    validates :name, uniqueness: true
    validates :name, :age, :username, :email, presence: true
    validates :email, uniqueness: true

    has_secure_password


    def game_lists
        my_games = self.games.map{|game| game.name}
        game_lists = {}
        self.systems.each do |system|
            system_list = []
            my_games.each do |game|
                if self.games.find_by(name: game).systems.include?(system)
                    system_list << game
                    my_games.delete(game)
                end
            game_lists[system.name] = system_list
            end
        end
        game_lists
    end
end
