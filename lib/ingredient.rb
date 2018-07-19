class Ingredient
  attr_reader :name, :cost

  def initialize(opt)
    @name = opt[:name]
    @cost = opt[:cost] # price 100g in cent's
  end

  def ==(obj)
    obj.name == @name && obj.cost == @cost
  end
end
