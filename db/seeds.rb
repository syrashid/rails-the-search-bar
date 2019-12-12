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

@sy = User.create(first_name: 'Sy',
                  last_name: 'Rashid',
                  email: 'sy@gmail.com',
                  password: 'password')

puts 'Seeding Sample Cocktails'
@tom = Cocktail.create(name: 'Tom Collins',
                       user: @sy,
                       remote_photo_url: 'https://i-love-png.com/images/333610_thumb.png')
@appletini = Cocktail.create(name: 'Apple Martini',
                user: @sy,
                remote_photo_url: 'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_apple_martini-1.png')
@liit = Cocktail.create(name: 'Long Island Ice Tea',
                user: @sy,
                remote_photo_url: 'https://cdn.shopify.com/s/files/1/0038/6049/6433/products/long-island-ice-tea_1080x.png?v=1569854167')
@pina = Cocktail.create(name: 'Pina Colada',
                user: @sy,
                remote_photo_url: 'https://www.finestcall.com/wp-content/uploads/sites/3/2017/11/finestcallpinacolada.png')
@marg = Cocktail.create(name: 'Margarita',
                user: @sy,
                remote_photo_url: 'https://www.cocktailartist.com/wp-content/uploads/2018/03/hellavamargarita.png')
@caipi = Cocktail.create(name: 'Caipirinha',
                user: @sy,
                remote_photo_url: 'https://bartenderonduty.ch/wp-content/uploads/2018/08/132-1.png')
@mintjul = Cocktail.create(name: 'Mint Julep',
                user: @sy,
                remote_photo_url: 'https://www.monin.com/us/media/catalog/product/cache/d8269468375af5c918c1809561ea76bf/B/l/Blueberry_Mint_Julep-1534128413-0.png')
@maitai = Cocktail.create(name: 'Mai Tai',
                user: @sy,
                remote_photo_url: 'https://sensationaldrinks.com/media/1287/mai-tai.png')
@mojito = Cocktail.create(name: 'Mojito',
                user: @sy,
                remote_photo_url: 'https://d32miag6ta013h.cloudfront.net/master_cocktails/185/en-gl/small/bacardi-mojito_sml_580x820..png')
@russian = Cocktail.create(name: 'White Russian',
                user: @sy,
                remote_photo_url: 'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_white_russian-1.png')
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

puts puts 'Making you a drink: Apple Martini'

puts '🍸'

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
