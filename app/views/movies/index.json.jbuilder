json.array! @movies do |movie|
  json.id movie.id
  json.title movie.title
  json.runtime_in_minutes movie.runtime_in_minutes
  json.rating movie.rating
  json.description movie.description.body.to_plain_text
end
