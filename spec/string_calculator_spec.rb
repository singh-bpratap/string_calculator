require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns true if add method is defined" do
      expect(StringCalculator.methods.include?(:add)).to be_truthy
    end

    context "empty string input should be accepted" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
        expect(StringCalculator.add(" ")).to eq(0)
        expect(StringCalculator.add(nil)).to eq(0)
      end
    end

    context "comma separated numbers in input should be accepted" do
      it "returns sum of numbers" do
        expect(StringCalculator.add("1,2")).to eq(3)
        expect(StringCalculator.add("1, 2")).to eq(3)
      end
    end
  end
end
