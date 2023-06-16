require 'open-uri'
require 'json'
require 'faker'

Movie.destroy_all

puts "Starting"
# Helper method to fetch movie data from the API
def fetch_movie_data(url)
  response = URI.open(url)
  JSON.parse(response.read)
end

# Seed fake movies using Faker
# 5.times do
#   title = Faker::Movie.title
#   overview = Faker::Lorem.paragraph
#   poster_url = Faker::LoremFlickr.image(size: '300x450', category: 'abstract')
#   rating = Faker::Number.between(from: 1, to: 10).to_f

#   Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
# end

# Seed real movies using the provided API
api_url = 'http://tmdb.lewagon.com/movie/top_rated'
api_key = '<your_api_key>'

url = "#{api_url}?api_key=#{api_key}"
movies_data = fetch_movie_data(url)

movies_data['results'].each do |movie_data|
  title = movie_data['title']
  overview = movie_data['overview']
  poster_url = "http://image.tmdb.org/t/p/original#{movie_data['poster_path']}"
  rating = movie_data['vote_average'].to_f

  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "finish"


# const results = document.querySelector("#results")

# fetch("http://tmdb.lewagon.com/movie/top_rated?api_key=")
#   .then(response => response.json())
#   .then((data) => {
#     data.Search.forEach((result) => {
#       const movieTag = `<li class="list-inline-item">
#         <img src="${result.Poster}" alt="">
#         <p>${result.Title}</p>
#       </li>`
#       results.insertAdjacentHTML("beforeend", movieTag)
#     })
#   })
