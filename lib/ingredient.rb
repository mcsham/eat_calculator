class Ingredient
attr_reader :name, :cost

  def initialize(opt)
    @name = opt[:name]
    @cost = opt[:cost]
  end

  def == (obj)
    obj.name == @name && obj.cost == @cost
  end
end
