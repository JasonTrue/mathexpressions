require_relative '../lib/mathexpressions.rb'

include Mathexpressions

RSpec.describe Mathexpressions do
  it "has a version number" do
    expect(Mathexpressions::VERSION).not_to be nil
  end

  describe "Addition" do
    it "Adds One Plus One" do
      expect(one(plus(one))).to eq(2.0  )
    end
  end
end
