json.extract! @cocktail, :id, :name
json.photo @cocktail.photo.url
json.ingredients @cocktail.doses do |dose|
  json.extract! dose, :description
  json.ingredient dose.ingredient.name
end
json.reviews @cocktail.reviews do |review|
  json.extract! review, :rating, :text
end
