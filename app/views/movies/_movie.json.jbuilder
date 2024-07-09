json.extract! movie, :id, :title, :runtime_in_minutes, :rating, :description, :image, :created_at, :updated_at
json.url movie_url(movie, format: :json)
json.description movie.description.body.to_plain_text
json.image url_for(movie.image)
