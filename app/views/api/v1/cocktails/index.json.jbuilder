json.array! @cocktails do |cocktail|
  json.extract! cocktail, :name, :created_at
  json.photo cocktail.photo.url
end
