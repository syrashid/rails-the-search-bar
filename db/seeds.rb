require 'open-uri'
require 'json'

puts 'Destroying Old Ingredients...'
Ingredient.destroy_all

puts 'Seeding New Ingredients...'
print '['
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  print '+ '
end
puts ']'
puts 'Completed Seeding Ingredients'

