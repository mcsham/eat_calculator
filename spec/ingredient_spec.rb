require 'ingredient'

describe Ingredient do
  describe '#==' do
    let(:pomodoro) { described_class.new(name: 'Tomato', cost: 100) }
    let(:tomato) { described_class.new(name: 'Tomato', cost: 200) }

    context "when ingredients are equal" do
      it "they are truly equel"  do
        expect(pomodoro).to eq(tomato)
      end
    end
    context "when ingredients are diff" do
      let(:potato) { described_class.new(name: 'Potato', cost: 90) }
      it "they are truly equel"  do
        expect(pomodoro).to_not eq(potato)
      end
    end
  end
end