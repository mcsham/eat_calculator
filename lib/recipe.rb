class Recipe
  attr_reader :name, :servings_count, :ingredient_qufntities

  def initialize(name: nil, ingredient_qufntities: nil)
    raise ArgumentError  unless name && ingredient_qufntities
    @name = name
    @ingredient_qufntities = ingredient_qufntities
  end


end