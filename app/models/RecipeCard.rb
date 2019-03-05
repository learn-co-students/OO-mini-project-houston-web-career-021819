class RecipeCard
  @@all = []
  attr_accessor :date, :rating, :user, :recipe
  def initialize(date:, rating:, user:, recipe:)
    self.date = date
    self.rating = rating
    self.user = user
    self.recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end
end
