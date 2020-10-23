# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all
GameSystem.destroy_all
System.destroy_all
SystemUser.destroy_all
Review.destroy_all

# system seeds

key = ENV["rawg_key"]

url = "https://api.rawg.io/api/platforms?key=#{key}"
response = RestClient.get(url)
data = JSON.parse(response)

data["results"].each do |system|
    id = system["id"]
    name = system["name"]
    image_url = system["image_background"]
    System.create(name: name, id: id, image_url:image_url)
end

# game seeds
url = "https://api.rawg.io/api/games?key=#{key}&page-1"
response = RestClient.get(url)
data = JSON.parse(response)

data["results"][0..10].each do |game|
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

# user seeds
sisan = User.create(name: "Sisan", email: "s@s.com", username:"sisan", password: "pass123", age: 21, interest: "Horror and Adventure games")
reid = User.create(name: "Reid", email:"r@r.com", username:"reid", password:"pass123", age: 26, interest: "Fantasy and Strategy games")
bill = User.create(name: "Bill", email:"b@b.com", username:"bill", password:"pass123", age: 31, interest: "pokemon")
greg = User.create(name: "Greg", email:"g@g.com", username:"greg", password:"pass123", age: 31, interest: "codin'")
caryn = User.create(name: "Caryn", email:"c@c.com", username:"caryn", password:"pass123", age: 26, interest: "cats")

# system_user seeds
User.all.each do |user|
    systems = System.all.sample(5)
    systems.each do |system|
        SystemUser.create(system_id: system.id, user_id: user.id)
    end
end

# review seeds
User.all.each do |user|
    games = Game.all.sample(5)
    games.each do |game| 
        Review.create(game_id: game.id, user_id: user.id, rating: (0..5).to_a.sample, title: "my title", description: "my description", completion_status: "Complete")
    end
end