class Ingredient
attr_reader :name, :cost

  def initialize(opt)
    @name = opt[:name]
    @cost = opt[:cost]
  end
end
