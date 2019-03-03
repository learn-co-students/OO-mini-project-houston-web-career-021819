class User
  @@all = []
  attr_accessor :name
  def initialize(name:)
    self.name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select {|rc| rc.user == self}
  end

  def recipes
    (self.recipe_cards.map {|rc| rc.recipe}).uniq
  end

  def add_recipe_card(recipe:, date:, rating:)
    RecipeCard.new(date: date, rating: rating, user: self, recipe: recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(user: self, ingredient: ingredient)
  end

  def allergens
    (Allergen.all.select {|a| a.user == self}).map {|a| a.ingredient}
  end

  def top_three_recipes
    self.recipe_cards.max_by(3) {|rc| rc.rating}
  end

  def most_recent_recipe
    self.recipe_cards.min_by(3) {|rc| rc.date}
  end

  def safe_recipes
    good_ingredient_lists = (Recipe.all.map {|r| r.ingredients}).select {|i_l| (self.allergens & i_l) == []}
    good_recipes = good_ingredient_lists.map do |i_l|
      Recipe.all.find_all do |recipe|
        recipe.ingredients == i_l
      end
    end.uniq
  end

end
