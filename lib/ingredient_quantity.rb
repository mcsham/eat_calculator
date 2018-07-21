require 'ingredient'

class IngredientQuantity < Ingredient
  attr_reader :total_cost, :quantity


  def initialize(ingredient:nil, quantity: 0)
    if ingredient
      super name: ingredient.name, cost: ingredient.cost
    else
      super name: nil,cost:nil
    end
    @quantity = quantity
    set_new_total_cost
  end

  def +(ingredient_quantity)
    if self == ingredient_quantity
      @quantity += ingredient_quantity.quantity
      set_new_total_cost
      self
    else
      ingredient_quantity
    end

  end
  private

  def set_new_total_cost
    @total_cost = @quantity * self.cost / 100
  end
end

# t = Ingredient.new name:"Tomato", cost: 80
#
# i = IngredientQuantity.new ingredient: t, quantity: 2000
# p i.total_cost