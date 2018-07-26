require 'recipe'
require 'rpec_configs'

describe Recipe do
  describe '#initialize' do
    context 'перевірка конструктора' do
      it 'помилкова к-сть параметрів' do
         expect{ described_class.new(name: 'name') }.to raise_error(ArgumentError)
         expect{ described_class.new(ingredient_quantities: [0]) }.to raise_error(ArgumentError)
      end
    end
  end
  describe '#total_cost' do
    let(:tomatos_bag) { to_bag( tomato(300), 550 ) } # 165
    let(:popatos_bag) { to_bag( potato(300), 150 ) } # 45
    let(:spagetti_bag) { to_bag( spagetti(1000), 200 ) } # 200
    let(:soup) { described_class.new( name: 'soup',
                                      ingredient_quantities: [tomatos_bag, popatos_bag],
                                      servings_count: 2) }
    it 'перевіряємо чи ціна не нуль' do
      expect(soup.total_cost).to_not eq(0)
    end

    it 'перевіряємо чи правильно ціка формується' do
      expect(soup.total_cost).to eq(410)
    end
  end

  describe '#ingredient_qufntities_per_servings' do

  end

  describe 'ingredient_qufntities_per_one_serving' do

  end

  describe 'cost_of_one_serving' do

  end
end