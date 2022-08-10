require 'json'
require 'open-uri'

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"

response = URI.open(url).read
movies = JSON.parse(response)

puts "Creating movies..."

movies['results'].each do |movie_hash|
  Movie.create!(
    title: movie_hash["title"],
    overview: movie_hash["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_hash["poster_path"]}",
    rating: movie_hash['vote_average'])
  end

puts "#{Movie.count} Movies created"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
