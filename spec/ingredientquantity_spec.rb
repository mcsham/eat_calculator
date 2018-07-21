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
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      it 'якщо обєкт був створений не пустий' do
        expect(ingredient_tomato.total_cost).to_not eq(0)
        expect(ingredient_tomato.total_cost).to eq(1600)
      end
    end
  end
  describe '#+' do

    context 'додаємо інгрідієнт' do
      # let(:ingredient_quantity) { described_class.new } #хз не ств
      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      it 'якщо обєкт пустий, при доданні задаємо деф. інгрієнт' do
        ingredient_quantity = described_class.new
        expect(ingredient_quantity.total_cost).to eq(0)
        expect(ingredient_quantity.name).to eq(nil)
        ingredient_quantity += ingredient_tomato
        expect(ingredient_quantity.quantity).to eq(ingredient_tomato.quantity)
        expect(ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost)
        expect(ingredient_quantity.name).to eq('Tomato')
      end

      let(:ingredient_tomato2) { described_class.new(ingredient: tomato, quantity: 1000) }
      it "якщо обэкт не пустий" do
        ingredient_quantity = ingredient_tomato + ingredient_tomato2
        expect(ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost + ingredient_tomato2.total_cost)
        expect(ingredient_quantity.name).to eq('Tomato')
        expect(ingredient_quantity.quantity).to eq(ingredient_tomato.quantity + \
                                                          ingredient_tomato2.quantity)
      end
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      let(:egs) { Ingredient.new(name: 'Egs', cost: 10) }
      let(:ingredient_egs) { described_class.new(ingredient: egs, quantity: 500) }
      it "якщо обэкт не пустий і продуємо додати левак" do
        ingredient_quantity += ingredient_egs
        expect(ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost)
        expect(ingredient_quantity.name).to eq('Tomato')
        expect(ingredient_quantity.quantity).to eq(ingredient_tomato.quantity)
      end
    end
  end

  describe "#*" do
    before do
      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
    end
    context "помножемо на обєкт" do
      let(:ingredient_quantity) { described_class.new }
      it "пустий обєкт" do
        ingredient_quantity *= 2
        expect(ingredient_quantity.total_cost).to eq(0)
        expect(ingredient_quantity.name).to eq(nil)
      end
      it "Не пустий обєкт * 2" do
        ingredient_tomato *= 2
        expect(ingredient_quantity.total_cost).to eq(3200)
        expect(ingredient_quantity.quantity).to eq(4000)
      end
      it "Не пустий обєкт * 10" do
        ingredient_tomato *= 10
        expect(ingredient_quantity.total_cost).to eq(16000)
        expect(ingredient_quantity.quantity).to eq(20000)
      end
      it "Не пустий обєкт * -3" do
        ingredient_tomato *= -3
        expect(ingredient_quantity.total_cost).to eq(1600)
        expect(ingredient_quantity.quantity).to eq(2000)
      end
      it "Не пустий обєкт * 0" do
        ingredient_tomato *= 0
        expect(ingredient_quantity.total_cost).to eq(1600)
        expect(ingredient_quantity.quantity).to eq(2000)
      end

    end
  end
end
