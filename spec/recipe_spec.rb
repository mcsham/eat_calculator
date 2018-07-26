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
    let(:tomatos_bag) { bag_of( tomato(300), 550 ) } # 165
    let(:popatos_bag) { bag_of( potato(300), 150 ) } # 45
    let(:spagetti_bag) { bag_of(spaghetti(1000), 200 ) } # 200
    let(:soup) { described_class.new( name: 'soup',
                                      ingredient_quantities: [tomatos_bag, popatos_bag],
                                      servings_count: 2) }
    let(:mecicano_spaghetti) { described_class.new( name: 'mecicano spaghetti',
                                        ingredient_quantities: [tomatos_bag, popatos_bag, spagetti_bag],
                                        servings_count: 1) }

    it 'перевіряємо чи ціна не нуль' do
      expect(soup.total_cost).to_not be zero
    end

    it 'перевіряємо чи правильно ціка формується' do
      expect(soup.total_cost).to eq(210)
      expect(mecicano_spaghetti.total_cost).to eq(410)
    end
  end

  describe '#ingredient_quantities_per_servings' do
    let(:tomatos_bag) { bag_of( tomato(300), 550 ) } # 165
    let(:popatos_bag) { bag_of( potato(300), 150 ) } # 45
    let(:soup) { described_class.new( name: 'soup',
                                      ingredient_quantities: [tomatos_bag, popatos_bag],
                                      servings_count: 2) }
    context 'агригатор к-сть інгредієнтів ' do
      it 'для  0 порції' do
        expect{ soup.ingredient_quantities_per_servings(n: 0) }.to raise_error(ArgumentError)
      end

      it 'для  1 порції' do
        result = soup.ingredient_quantities_per_servings(n: 1).map do |ingredient_quantity|
          ingredient_quantity.quantity
        end
        expect(result).to eq([275, 75])
      end
      it 'для  3 порції' do
        result = soup.ingredient_quantities_per_servings(n: 3).map do |ingredient_quantity|
          ingredient_quantity.quantity
        end
        expect(result).to eq([825, 225])
      end
      it 'для  5 порції' do
        result = soup.ingredient_quantities_per_servings(n: 5).map do |ingredient_quantity|
          ingredient_quantity.quantity
        end
        expect(result).to eq([1375, 375])
      end

    end

    let(:spagetti_bag) { bag_of(spaghetti(1000), 200 ) } # 200
    let(:mecicano_spaghetti) { described_class.new( name: 'mecicano spaghetti',
                                                    ingredient_quantities: [tomatos_bag, popatos_bag, spagetti_bag],
                                                    servings_count: 1) }

  end

  describe 'ingredient_quantities_per_one_serving' do

  end

  describe 'cost_of_one_serving' do

  end
end