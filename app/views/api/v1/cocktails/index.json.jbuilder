json.array! @cocktails do |cocktail|
  json.extract! cocktail, :name
  json.url_path url_for(cocktail_path(cocktail))
  json.photo cocktail.photo.url
end
