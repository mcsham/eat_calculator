require 'ingredient'

class IngredientQuantity
  attr_reader :total_cost, :quantity, :ingredient


  def initialize(ingredient:nil, quantity: 0)
    @quantity = quantity
    @ingredient = ingredient
    @total_cost = 0
    set_new_total_cost

  end

  def +(ingredient_quantity)
    if @ingredient == ingredient_quantity.ingredient
      quantity =  @quantity + ingredient_quantity.quantity
      IngredientQuantity.new( ingredient: @ingredient, quantity: quantity)
    else
      raise ArgumentError
    end
  end

  def *(count)
    if count>0 && @ingredient
      @quantity = (@quantity *count).to_i
      set_new_total_cost
      self
    else
      raise ArgumentError
    end

  end

  private

  def set_new_total_cost
    @total_cost = @quantity * @ingredient.cost / 1000 if @ingredient
  end
end