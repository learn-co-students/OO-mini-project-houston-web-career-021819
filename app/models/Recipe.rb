class Recipe
  @@all = []
  attr_accessor :title
  def initialize(title:)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select {|rc| rc.recipe == self}
  end

  def users
    (self.recipe_cards.map {|rc| rc.user}).uniq
  end

  def recipe_ingredients
    RecipeIngredient.all.select {|ri| ri.recipe == self}
  end

  def ingredients
    (self.recipe_ingredients.map {|ri| ri.ingredient}).uniq
  end

  def allergens
    self.ingredients & (Allergen.all.map {|a| a.ingredient}).uniq
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each {|ing| RecipeIngredient.new(recipe: self, ingredient: ing)}
  end

  def self.most_popular
    (RecipeCard.all.map{|rc| rc.recipe}).max_by{|i| (RecipeCard.all.map{|rc| rc.recipe}).count(i)}
  end
end
