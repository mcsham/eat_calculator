require 'recipe'

describe Recipe do
  describe '#initialize' do
    context 'перевірка конструктора' do
      it 'помилкова к-сть параметрів' do
         expect{ described_class.new(name: 'name') }.to raise_error(ArgumentError)
         expect{ described_class.new(ingredient_qufntities: [0]) }.to raise_error(ArgumentError)
      end
    end
  end
  describe '#total_cost' do

  end

  describe '#ingredient_qufntities_per_servings' do

  end

  describe 'ingredient_qufntities_per_one_serving' do

  end

  describe 'cost_of_one_serving' do

  end
end