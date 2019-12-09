json.array! @cocktails do |cocktail|
  json.extract! cocktail, :name
  json.information cocktail, :id, :photo
end
