require_relative '../config/environment.rb'


alexa = User.new(name: 'Alexa')
mark = User.new(name: 'Mark')
josh = User.new(name: 'Josh')

pizza_dough = Recipe.new(title: 'Pizza Dough')
butter_chicken = Recipe.new(title: 'Butter Chicken')
paella = Recipe.new(title: 'Paella')
enchiladas = Recipe.new(title: 'Enchiladas')

rice = Ingredient.new(ingredient: 'Rice')
chicken = Ingredient.new(ingredient: 'Chicken')
flour = Ingredient.new(ingredient: 'Flour')
yeast = Ingredient.new(ingredient: 'Yeast')
wine = Ingredient.new(ingredient: 'Wine')
tomatoes = Ingredient.new(ingredient: 'Tomatoes')
spices = Ingredient.new(ingredient: 'Spices')
peppers = Ingredient.new(ingredient: 'Peppers')
shrimp = Ingredient.new(ingredient: 'Shrimp')
tortillas = Ingredient.new(ingredient: 'Torillas')
cheese = Ingredient.new(ingredient: 'Cheese')

pizza_dough.add_ingredients([flour, yeast, wine])
butter_chicken.add_ingredients([rice, chicken, tomatoes, spices])
paella.add_ingredients([rice, chicken, tomatoes, spices, shrimp])
enchiladas.add_ingredients([chicken, peppers, tortillas, cheese])

alexa.add_recipe_card(date: '030119', rating: 5, recipe: pizza_dough)
alexa.add_recipe_card(date: '030119', rating: 5, recipe: butter_chicken)
alexa.add_recipe_card(date: '030119', rating: 5, recipe: paella)
alexa.add_recipe_card(date: '030119', rating: 5, recipe: enchiladas)
mark.add_recipe_card(date: '030119', rating: 5, recipe: pizza_dough)
josh.add_recipe_card(date: '030119', rating: 5, recipe: pizza_dough)
josh.add_recipe_card(date: '030119', rating: 5, recipe: butter_chicken)
josh.add_recipe_card(date: '030119', rating: 5, recipe: paella)

mark.declare_allergen(shrimp)
mark.declare_allergen(cheese)

pizza_dough_2 = Recipe.new(title: 'Pizza Dough 2')
pizza_dough_2.add_ingredients([flour,yeast,wine]) #testing for .safe_allergens



binding.pry
