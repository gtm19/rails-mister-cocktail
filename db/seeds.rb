# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Deleting all ingredients"
Ingredient.destroy_all

ingredient_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(URI.open(ingredient_url).read)

ingredients.flatten[1].each do |array|
  ingredient = array.values.first
  p "Adding #{ingredient} to db"
  Ingredient.create(name: ingredient)
end
