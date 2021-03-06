require_relative '../lib/mathexpressions.rb'

include Mathexpressions

RSpec.describe Mathexpressions do
  it "has a version number" do
    expect(Mathexpressions::VERSION).not_to be nil
  end

  describe "Addition" do
    it "Adds one plus one" do
      expect(one(plus(one))).to eq(2.0)
    end

    it "Adds one plus two" do
      expect(one(plus(two))).to eq(3.0)
    end

    it "Adds one plus nine" do
      expect(one(plus(nine))).to eq(10.0)
    end
  end

  describe "Multiplication" do
    it "multiplies six times five" do
      expect(six(times(five))).to eq(30.0)
    end
  end

  describe "Subtraction" do
    it "subtracts 3 from 6" do
      expect(six(minus(three))).to eq(3.0)
    end
  end

  describe "Division" do
    it "divides 8 by 2" do
      expect(eight(divided_by(two))).to eq(4.0)
    end

    # The specification is ambiguous about whether integer math is required
    # or not, but I chose to make sure it works with floating point, just to
    # be slightly less surprising.
    it "divides 1 by 2" do
      expect(one(divided_by(two))).to eq(0.5)
    end
  end
end
