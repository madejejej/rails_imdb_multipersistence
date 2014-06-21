json.array!(@movies) do |movie|
  json.extract! movie, :id, :idmovies, :title, :year, :number, :type, :location, :language
  json.url movie_url(movie, format: :json)
end
