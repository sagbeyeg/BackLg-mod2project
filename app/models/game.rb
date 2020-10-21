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
        games = []
        data["results"][1..9].each do |g|
            # byebug
            attributes = {}
            attributes["name"] = g["name"] if g["name"]
            attributes["rating"] = g["rating"] if g["rating"]
            attributes["esrb_rating"] = "everyone"
            attributes["rating_count"] = g["reviews_count"] if g["reviews_count"]
            attributes["genre"] = g["genres"][0]["name"] if g["genres"] != []
            platform_ids = g["platforms"].map{|platform| platform["platform"]["id"]} if g["platforms"].map{|platform| platform["platform"]["id"]}
            attributes["image_url"] = g["background_image"] if g["background_image"]
            # game = Game.create(name: name, rating: rating, esrb_rating: esrb_rating, rating_count: rating_count, genre: genre, image_url:image_url)
            game = Game.find_or_create_by(attributes)
            games << game if game.valid?
            platform_ids.each do |platform_id|
                GameSystem.create(game_id: game.id, system_id: platform_id)
            end
        end
        games
    end

end