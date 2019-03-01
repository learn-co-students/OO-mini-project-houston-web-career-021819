class Ingredient
  @@all = []
  attr_accessor :user, :ingredient
  def initialize(user:, ingredient:)
    self.user = user
    self.ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    (Allergen.all.map{|a| a.ingredient}).max_by{|i| (Allergen.all.map{|a| a.user}).count(i)}
  end 
end
