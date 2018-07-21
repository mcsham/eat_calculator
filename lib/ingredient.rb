class Ingredient
  attr_reader :name, :cost

  def initialize(name:, cost:)
    @name = name || nil
    @cost = cost || 0 # price 100g in cent's
  end

  def ==(obj)
    obj.name == @name && obj.cost == @cost
  end
end
