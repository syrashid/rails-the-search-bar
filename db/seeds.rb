require 'open-uri'
require 'json'

# puts 'Destroying Old Doses...'
# Dose.destroy_all
# puts 'Destroying Old Cocktails...'
# Cocktail.destroy_all
# puts 'Destroying Old Ingredients...'
# Ingredient.destroy_all
# puts 'Destroying Old Users...'
# User.destroy_all

puts 'Seeding New Ingredients...'
print '['
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  print '+ '
end
Ingredient.create(name: 'Cachaca')
Ingredient.create(name: 'Mint leaves')
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
  remote_photo_url: 'https://www.trzcacak.rs/myfile/full/424-4249027_clipart-library-library-ideas-for-the-house-apple.png')
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
@mojito = Cocktail.create(name: 'Mojito',
  user: @sy,
  remote_photo_url: 'https://d32miag6ta013h.cloudfront.net/master_cocktails/185/en-gl/small/bacardi-mojito_sml_580x820..png')
@russian = Cocktail.create(name: 'White Russian',
  user: @sy,
  remote_photo_url: 'https://images.cocktailflow.com/v1/cocktail/w_300,h_540/cocktail_white_russian-1.png')
puts 'Completed Seeding Drinks'

@ice = Ingredient.where(name: 'Ice').first
@vodka = Ingredient.where(name: 'Vodka').first
@applejack = Ingredient.where(name: 'Applejack').first
@gin = Ingredient.where(name: 'Gin').first
@lrum = Ingredient.where(name: 'Light rum').first
@tequila = Ingredient.where(name: 'Tequila').first
@triplesec = Ingredient.where(name: 'Triple sec').first
@lemonjuice = Ingredient.where(name: 'Lemon juice').first
@syrup = Ingredient.where(name: 'Sugar syrup').first
@clubsoda = Ingredient.where(name: 'Carbonated water').first
@pineapplejuice = Ingredient.where(name: 'Pineapple juice').first
@drum = Ingredient.where(name: 'Spiced rum').first
@cream = Ingredient.where(name: 'Heavy cream').first
@limejuice = Ingredient.where(name: 'Lime juice').first
@melonliq = Ingredient.where(name: 'Midori melon liqueur').first
@lime = Ingredient.where(name: 'Lime').first
@sugar = Ingredient.where(name: 'Sugar').first
@cachaca = Ingredient.where(name: 'Cachaca').first
@mintleaves = Ingredient.where(name: 'Mint leaves').first
@bourbon = Ingredient.where(name: 'Bourbon').first
@kahlua = Ingredient.where(name: 'Kahlua').first

puts ' '

puts 'Making you a drink: Tom Collins'

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

puts 'Making you a drink: Apple Martini'

puts '🍸'

Dose.create(description: 'Cubes of',
  cocktail: @appletini,
  ingredient: @ice)

Dose.create(description: '2 Oz',
  cocktail: @appletini,
  ingredient: @vodka)

Dose.create(description: '0.5 Oz',
  cocktail: @appletini,
  ingredient: @lemonjuice)

Dose.create(description: '1 Oz',
  cocktail: @appletini,
  ingredient: @applejack)

puts ' '

puts 'Making you a drink: Long Island Iced Tea'

puts '🍸'

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @vodka)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @lrum)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @tequila)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @gin)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @triplesec)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @syrup)

Dose.create(description: '0.75 Oz',
  cocktail: @liit,
  ingredient: @lemonjuice)

puts ' '

puts 'Making you a drink: Pina Colada'

puts '🍸'

Dose.create(description: '1.5 Oz',
  cocktail: @pina,
  ingredient: @lrum)

Dose.create(description: '2 Oz Coconut',
  cocktail: @pina,
  ingredient: @cream)

Dose.create(description: '2 Oz',
  cocktail: @pina,
  ingredient: @pineapplejuice)

Dose.create(description: '2 Cups',
  cocktail: @pina,
  ingredient: @ice)

Dose.create(description: '0.5 Oz',
  cocktail: @pina,
  ingredient: @drum)

puts ' '

puts 'Making you a drink: Margarita'

puts '🍸'

Dose.create(description: '2 Oz',
  cocktail: @marg,
  ingredient: @tequila)

Dose.create(description: '1 Oz',
  cocktail: @marg,
  ingredient: @limejuice)

Dose.create(description: '0.5 Oz',
  cocktail: @marg,
  ingredient: @melonliq)

Dose.create(description: '0.5 Oz',
  cocktail: @marg,
  ingredient: @syrup)

puts ' '

puts 'Making you a drink: Caipirinha'

puts '🍸'

Dose.create(description: '1/2',
  cocktail: @caipi,
  ingredient: @lime)

Dose.create(description: '2 Tsp',
  cocktail: @caipi,
  ingredient: @sugar)

Dose.create(description: '2 Oz',
  cocktail: @caipi,
  ingredient: @cachaca)

puts ' '

puts 'Making you a drink: Mint Julep'

puts '🍸'

Dose.create(description: '0.25 Oz',
  cocktail: @mintjul,
  ingredient: @syrup)

Dose.create(description: '8',
  cocktail: @mintjul,
  ingredient: @mintleaves)

Dose.create(description: '2 Oz',
  cocktail: @mintjul,
  ingredient: @bourbon)

puts ' '

puts 'Making you a drink: Mojito'

puts '🍸'

Dose.create(description: '2 Oz',
  cocktail: @mojito,
  ingredient: @lrum)

Dose.create(description: '3',
  cocktail: @mojito,
  ingredient: @mintleaves)

Dose.create(description: '0.75 Oz',
  cocktail: @mojito,
  ingredient: @lemonjuice)

Dose.create(description: '0.5 Oz',
  cocktail: @mojito,
  ingredient: @syrup)

puts ' '

puts 'Making you a drink: White Russian'

puts '🍸'

Dose.create(description: '2 Oz',
  cocktail: @russian,
  ingredient: @vodka)

Dose.create(description: '1 Oz',
  cocktail: @russian,
  ingredient: @kahlua)

Dose.create(description: 'Splash of',
  cocktail: @russian,
  ingredient: @cream)

puts ' '

puts 'Adding Reviews for Drinks'

puts '🤔'

@sample_reviews = ['Wonderful drink', 'Super tasty', 'Loved it!', "It's all about balance", 'Loved making it', 'Not the drink for me', 'Yum yum yum', 'Loved it at night, hated it the next morning!']

@cocktails = Cocktail.all

@cocktails.each do |cocktail|
  rand(3..10).times do
    Review.create(text: @sample_reviews.sample,
                  rating: rand(1..5),
                  cocktail: cocktail)
  end
end

puts 'Done... Enjoy!'
