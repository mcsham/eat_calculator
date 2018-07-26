require 'ingredient'
require 'ingredient_quantity'

module Helpers
  def to_bug(ingredient, quantities)
    IngredientQuantity.new(ingredient: ingredient, quantities: quantities)
  end
  def method_missing(symbol, *args)
    Ingredient.new(name: symbol.id2name, cost: args[0])
  end

end
