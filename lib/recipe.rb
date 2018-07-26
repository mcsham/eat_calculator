class Recipe
  attr_reader :name, :servings_count, :ingredient_quantities, :total_cost

  def initialize(name: nil, ingredient_quantities: nil, servings_count: nil)
    raise ArgumentError  unless name && ingredient_quantities && servings_count
    @name = name
    @servings_count = servings_count
    @ingredient_quantities = ingredient_quantities
    calc_total_cost
  end

  private

  def calc_total_cost
    @total_cost = @ingredient_quantities.reduce(0) do |result, ingredient_quantitie|
      result += ingredient_quantitie.total_cost
    end
  end



end