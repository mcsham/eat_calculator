require 'ingredient'
require 'ingredient_quantity'

module Helpers
  def bag_of(ingredient, quantities)
    IngredientQuantity.new(ingredient: ingredient, quantity: quantities)
  end
  def method_missing(symbol, *args)
    Ingredient.new(name: symbol.id2name, cost: args[0])
  end

end
