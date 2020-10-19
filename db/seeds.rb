# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


url = "https://api.rawg.io/api/games?page=1"
response = RestClient.get(url)
data = JSON.parse(response)


data["results"].each do |game|
    name = game["name"]
    rating = game["rating"]
    esrb_rating = game["everyone"]
    rating_count = game["reviews_count"]
    genre = game["genres"][0]["name"]
   
    Game.create()
end