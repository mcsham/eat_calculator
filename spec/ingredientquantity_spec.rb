require 'ingredient_quantity'
require 'ingredient'

describe IngredientQuantity do
  describe '#total_cost' do
    context 'перевірка значення вартісті' do
      let(:ingredient_quantity) { described_class.new }
      it 'якщо пустий обєкт має бути рівним 0' do
        expect(ingredient_quantity.total_cost).to eq(0)
      end

      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_quantity) { described_class.new(ingredient: tomato, quantity: 2000) }
      it 'якщо обєкт був створений не пустий' do
        expect(ingredient_quantity.total_cost).to_not eq(0)
        expect(ingredient_quantity.total_cost).to eq(1600)
      end
    end
  end
  describe '#+' do
    context 'додаємо інгрідієнт' do
      let(:ingredient_quantity) { described_class.new }
      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      it 'якщо обєкт пустий, при доданні задаємо деф. інгрієнт' do
        expect(ingredient_quantity.total_cost).to eq(0)
        expect(ingredient_quantity.name_ingredient).to eq(nil)
        ingredient_quantity += ingredient_tomato
        expect(ingredient_quantity.quantity).to eq(ingredient_tomato.quantity)
        expect(new_ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost)
        expect(new_ingredient_quantity.name_ingredient).to eq('Tomato')
      end
      let(:ingredient_tomato2) { described_class.new(ingredient: tomato, quantity: 1000) }
      it "якщо обэкт не пустий" do
        ingredient_quantity += ingredient_tomato2
        expect(ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost +\
                                                            ingredient_tomato2.total_cost)
        expect(ingredient_quantity.name_ingredient).to eq('Tomato')
        expect(ingredient_quantity.quantity).to eq(ingredient_tomato.quantity + \
                                                          ingredient_tomato2.quantity)
      end
    end
  end
  describe "#*" do
    context "помножемо на обєкт" do
      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      it "" do

      end
    end
  end
end
