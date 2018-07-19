require 'ingredient_quantity'
require 'ingredient'


describe IngredientQuantity do
  describe "#total_cost" do

    context "перевірка значення вартісті" do
      let(:ingredient_quantity) { described_class.new() }
      it "якщо пустий обєкт має бути рівним 0" do
        expect(ingredient_quantity.total_cost).to eq(0)
      end

      let(:tomato) { Ingredient.new(name: 'Tomato', cost: 80) }
      let(:ingredient_quantity) { described_class.new(ingredient: tomato, quantity: 2000) }
      it "якщо обєкт був створений не пустий значення не нуль" do
        expect(ingredient_quantity.total_cost).to_not eq(0)
        expect(ingredient_quantity.total_cost).to eq(1600)
      end


    end


    let(:tomato) { described_class.new(name: 'Tomato', cost: 100) }
  end
end