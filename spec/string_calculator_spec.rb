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

    context "new line separated numbers in input should be accepted" do
      it "returns sum of numbers" do
        expect(StringCalculator.add("1\n2")).to eq(3)
        expect(StringCalculator.add("1\n 2")).to eq(3)
        expect(StringCalculator.add("1\n,2")).to eq(3)
        expect(StringCalculator.add("1\n, 2")).to eq(3)
        expect(StringCalculator.add("1,\n2")).to eq(3)
        expect(StringCalculator.add("1,\n 2")).to eq(3)
      end

      it "returns error message if new line is at the end of string" do
        expect(StringCalculator.add("1\n")).to eq('Invalid input')
      end
    end

    context "negative numbers in input should not be accepted" do
      it "returns error message" do
        expect(StringCalculator.add("1,-2")).to include("Invalid inputs")
      end

      it "returns error message with invalid number(s)" do
        expect(StringCalculator.add("1,-2")).to eq("Invalid inputs: -2")
        expect(StringCalculator.add("1, -2, -3")).to eq("Invalid inputs: -2, -3")
      end
    end
  end
end
