require 'open-uri'
require 'json'

puts 'Destroying Old Doses...'
Dose.destroy_all
puts 'Destroying Old Cocktails...'
Cocktail.destroy_all
puts 'Destroying Old Ingredients...'
Ingredient.destroy_all
puts 'Destroying Old Users...'
User.destroy_all

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

puts 'Seeding Sample Cocktails'
@tom = Cocktail.create(name: 'Tom Collins', remote_photo_url: 'https://c7.uihere.com/files/948/354/439/cocktail-vodka-tom-collins-mojito-martini-ginger.jpg')
Cocktail.create(name: 'Apple Martini')
Cocktail.create(name: 'Long Island Ice Tea')
Cocktail.create(name: 'Californication')
Cocktail.create(name: 'Pina Colada')
Cocktail.create(name: 'Margarita')
Cocktail.create(name: 'Caipirinha')
Cocktail.create(name: 'Mint Julep')
Cocktail.create(name: 'Mai Tai')
Cocktail.create(name: 'Mojito')
puts 'Completed Seeding Drinks'

puts 'Making you a drink: Tom Collins'

puts '🍸'

@ice = Ingredient.where(name: 'Ice').first
puts '🥶 Adding Ice'
@gin = Ingredient.where(name: 'Gin').first
puts '🌲 Adding Gin'
@lemonjuice = Ingredient.where(name: 'Lemon juice').first
puts '🍋 Adding Lemon'
@syrup = Ingredient.where(name: 'Sugar Syrup').first
puts '🍭 Adding Sugar'
@clubsoda = Ingredient.where(name: 'Carbonated water').first
puts '🥤 Adding Club Soda'

puts 'Mixing'

@sy = User.create(first_name: 'Sy',
                  last_name: 'Rashid',
                  email: 'sy@gmail.com',
                  password: 'password')

150.times { print '*' }

Dose.create(description: '1.5 Cups',
            cocktail: @tom,
            ingredient: @ice)

Dose.create(description: '2 Oz',
            cocktail: @tom,
            ingredient: @gin)

Dose.create(description: '0.75 Oz',
            cocktail: @tom,
            ingredient: @lemonjuice)

Dose.create(description: '0.5 Oz',
            cocktail: @tom,
            ingredient: @syrup)

Dose.create(description: '1.5 Cups',
            cocktail: @tom,
            ingredient: @ice)

Dose.create(description: '2 Oz',
            cocktail: @tom,
            ingredient: @clubsoda)

puts ' '
puts 'Done... Enjoy!'
