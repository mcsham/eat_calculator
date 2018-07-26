require 'ingredient_quantity'
require 'ingredient'

describe IngredientQuantity do

  describe '#total_cost' do
    context 'перевірка значення вартісті' do
      let(:ingredient_quantity) { described_class.new }
      it 'якщо пустий обєкт має бути рівним 0' do
        expect(ingredient_quantity.total_cost).to eq(0)
      end
      let(:tomato) {Ingredient.new(name: 'Tomato', cost: 80)}
      let(:ingredient_tomato) {described_class.new(ingredient: tomato, quantity: 2000)}
      it 'якщо обєкт був створений не пустий' do
        expect(ingredient_tomato.total_cost).to_not eq(0)
        expect(ingredient_tomato.total_cost).to eq(160)
      end
    end
  end

  describe '#+' do
    let(:tomato) {Ingredient.new(name: 'Tomato', cost: 80)}
    let(:ingredient_tomato2) { described_class.new(ingredient: tomato, quantity: 1000) }
      let(:ingredient_tomato) { described_class.new(ingredient: tomato, quantity: 2000) }
      it "якщо обэкт не пустий" do
        ingredient_quantity = ingredient_tomato + ingredient_tomato2
        expect(ingredient_quantity.total_cost).to eq(ingredient_tomato.total_cost + ingredient_tomato2.total_cost)
      end

      let(:egs) { Ingredient.new(name: 'Egs', cost: 10) }
      let(:ingredient_egs) { described_class.new(ingredient: egs, quantity: 500) }
      it "якщо обэкт не пустий і продуємо додати левак" do
        expect{ingredient_tomato + ingredient_egs}.to raise_error(ArgumentError)
      end
    end

  describe '#*' do
    before do
      tomato = Ingredient.new(name: 'Tomato', cost: 80)
      @ingredient_tomato = described_class.new(ingredient: tomato, quantity: 2000)
    end

    context "помножемо на обєкт" do
      ingredient_quantity = described_class.new
      it "пустий обєкт" do
        expect {ingredient_quantity *= 2}.to raise_error(ArgumentError)
      end

      it "Не пустий обєкт * 2" do
        @ingredient_tomato *= 2
        expect(@ingredient_tomato.total_cost).to eq(320)
        expect(@ingredient_tomato.quantity).to eq(4000)
      end
      it "Не пустий обєкт * 10" do
        @ingredient_tomato *= 10
        expect(@ingredient_tomato.total_cost).to eq(1600)
        expect(@ingredient_tomato.quantity).to eq(20000)
      end
      it "Не пустий обєкт * 0.5" do
        @ingredient_tomato *= 0.5
        expect(@ingredient_tomato.total_cost).to eq(80)
        expect(@ingredient_tomato.quantity).to eq(1000)
      end
      it "Не пустий обєкт * -3" do
        expect {ingredient_quantity *= -3}.to raise_error(ArgumentError)
      end
      it "Не пустий обєкт * 0" do
        expect {ingredient_quantity *= 0}.to raise_error(ArgumentError)
      end
    end
  end
end
