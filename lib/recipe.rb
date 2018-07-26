class Recipe
  attr_reader :name, :servings_count, :ingredient_quantities
  attr_reader :total_cost, :ingredient_quantities_per_one
  attr_reader :cost_of_one_serving


  def initialize(name: nil, ingredient_quantities: nil, servings_count: nil)
    raise ArgumentError  unless name && ingredient_quantities && servings_count
    @name = name
    @servings_count = servings_count
    @ingredient_quantities = ingredient_quantities

    calc_total_cost
  end


  def ingredient_quantities_per_servings(n:)
    raise ArgumentError if n.zero?
    @ingredient_quantities.map do |ingredient_quantity|
      ingredient_quantity *= n/@servings_count.to_f
    end
  end

  private

  def calc_total_cost
    @total_cost = @ingredient_quantities.reduce(0) do |result, ingredient_quantity|
      result += ingredient_quantity.total_cost
    end
  end

  def calc_ingredient_quantities_per_one_and_cost

  end


end