# db/seeds.rb
require 'open-uri'

movies = [
  {
    title: "Spirited Away",
    runtime_in_minutes: 125,
    rating: :pg,
    description: "Chihiro and her parents are moving to a small Japanese town in the countryside, much to Chihiro's dismay. On the way to their new home, Chihiro's father makes a wrong turn and drives down a lonely one-lane road which dead-ends in front of a tunnel. Her parents decide to stop the car and explore the area. They go through the tunnel and find an abandoned amusement park on the other side, with its own little town...",
    image: "https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg"
  },
  {
    title: "Interstellar",
    runtime_in_minutes: 169,
    rating: :"pg-13",
    description: "Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life...",
    image: "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_Ratio0.6716_AL_.jpg"
  },
  {
    title: "Rear Window",
    runtime_in_minutes: 112,
    rating: :pg,
    description: 'Professional photographer L.B. "Jeff" Jefferies breaks his leg while getting an action shot at an auto race. Confined to his New York apartment, he spends his time looking out of the rear window observing the neighbors. He begins to suspect that a man across the courtyard may have murdered his wife. Jeff enlists the help of his high society fashion-consultant girlfriend Lisa Freemont and his visiting nurse Stella to investigate...',
    image: "https://m.media-amazon.com/images/M/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_Ratio0.6716_AL_.jpg"
  },
  {
    title: "Raiders of the Lost Ark",
    runtime_in_minutes: 115,
    rating: :pg,
    description: "The year is 1936. An archeology professor named Indiana Jones is venturing in the jungles of South America searching for a golden statue. Unfortunately, he sets off a deadly trap but miraculously escapes. Then, Jones hears from a museum curator named Marcus Brody about a biblical artifact called The Ark of the Covenant, which can hold the key to humanly existence. Jones has to venture to vast places such as Nepal and Egypt to find this artifact...",
    image: "https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_Ratio0.6716_AL_.jpg"
  }
  # Add more movies here...
]

puts "-------------------  SEEDING DATABASE -------------"
movies.each do |movie_data|
  movie = Movie.create!(
    title: movie_data[:title],
    runtime_in_minutes: movie_data[:runtime_in_minutes],
    rating: movie_data[:rating],
    description: movie_data[:description]
  )

  # Attach the image using Active Storage
  image_file = URI.open(movie_data[:image])
  movie.image.attach(io: image_file, filename: "#{movie_data[:title].parameterize}.jpg")
end


puts "--------- DONE ! ---------------------"