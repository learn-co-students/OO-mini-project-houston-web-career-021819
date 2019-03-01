class RecipeIngredient
  @@all = []
  attr_accessor :recipe, :ingredient
  def initialize(recipe:, ingredient:)
    self.recipe = recipe
    self.ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
