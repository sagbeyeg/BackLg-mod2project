class Game < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    has_many :reviews
    has_many :users, through: :reviews
    has_many :game_systems
    has_many :systems, through: :game_systems

    def self.search(game)
        game = game.gsub(" ","%20")
        url = "https://api.rawg.io/api/games?search=" + game
        response = RestClient.get(url)
        data = JSON.parse(response)
        # games = data["results"].map {|result| result["name"]}

        data["results"].each do |game|
            name = game["name"]
            rating = game["rating"]
            esrb_rating = "everyone"
            rating_count = game["reviews_count"]
            genre = game["genres"][0]["name"]
            platform_ids = game["platforms"].map{|platform| platform["platform"]["id"]}
            image_url = game["background_image"]
            game = Game.create(name: name, rating: rating, esrb_rating: esrb_rating, rating_count: rating_count, genre: genre, image_url:image_url)
            platform_ids.each do |platform_id|
                GameSystem.create(game_id: game.id, system_id: platform_id)
            end
        end
    end

end