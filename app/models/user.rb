class User < ApplicationRecord
    has_many :reviews
    has_many :games, through: :reviews
    has_many :system_users
    has_many :systems, through: :system_users

    validates :name, uniqueness: true
    validates :name, :age, :username, :email, presence: true
    validates :email, uniqueness: true
    validates :username, uniqueness: true

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

    def filter_games(game_list)
        if game_list == ""
            filtered_games = self.games
        else
            game_lists = self.game_lists
            filtered_games = []
            game_lists[game_list].each do |game|
                game_instance = Game.find_by(name: game)
                filtered_games << game_instance
            end
        end
        filtered_games
    end

end
