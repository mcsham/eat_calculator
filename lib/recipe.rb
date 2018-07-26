class Recipe
  attr_reader :name, :servings_count, :ingredient_quantities

  def initialize(name: nil, ingredient_quantities: nil, servings_count: nil)
    raise ArgumentError  unless name && ingredient_quantities && servings_count
    @name = name
    @servings_count = servings_count
    @ingredient_quantities = ingredient_quantities
  end


end