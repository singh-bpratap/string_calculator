require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns true if add method is defined" do
      expect(StringCalculator.methods.include?(:add)).to be_truthy
    end

    it "returns true if allow to handle an any amount of numbers in arguments" do
      begin
        expect{StringCalculator.add("1")}.not_to raise_error
        expect{StringCalculator.add("1", "2")}.not_to raise_error
      rescue RSpec::Expectations::ExpectationNotMetError => e
        expect(e.message).not_to include 'ArgumentError'
      end
    end

    context "empty string input should be accepted" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
        expect(StringCalculator.add(" ")).to eq(0)
        expect(StringCalculator.add(",")).to eq(0)
        expect(StringCalculator.add(nil)).to eq(0)
      end
    end

    context "empty list input should be accepted" do
      it "returns 0" do
        expect(StringCalculator.add([])).to eq(0)
      end
    end

    context "list with empty elements in input should be accepted" do
      it "returns 0" do
        expect(StringCalculator.add([nil])).to eq(0)
        expect(StringCalculator.add([nil, 3])).to eq(3)
        expect(StringCalculator.add([""])).to eq(0)
        expect(StringCalculator.add(["", 4])).to eq(4)
        expect(StringCalculator.add([nil, ""])).to eq(0)
        expect(StringCalculator.add([nil, "", 2])).to eq(2)
        expect(StringCalculator.add(nil, "", 2)).to eq(2)
      end

      it "returns the sum of numbers other than empty elements" do
        expect(StringCalculator.add([nil, 3])).to eq(3)
        expect(StringCalculator.add(["", 4])).to eq(4)
        expect(StringCalculator.add([nil, "", 2])).to eq(2)
        expect(StringCalculator.add(nil, "", 2)).to eq(2)
      end
    end

    context "numbers as string or integer or both in input should be accepted" do
      it "returns sum of numbers" do
        expect(StringCalculator.add(1, 2)).to eq(3)
        expect(StringCalculator.add("1", "2")).to eq(3)
        expect(StringCalculator.add("1", 2)).to eq(3)
      end
    end

    context "numbers or array of numbers or both in input should be accepted" do
      it "returns sum of numbers" do
        expect(StringCalculator.add(1, 2)).to eq(3)
        expect(StringCalculator.add([1, 2])).to eq(3)
        expect(StringCalculator.add(1, [2, 3])).to eq(6)
        expect(StringCalculator.add([1, 2], 3)).to eq(6)
      end
    end

    context "comma separated numbers in input should be accepted" do
      it "returns sum of numbers" do
        expect(StringCalculator.add("1, 2")).to eq(3)
        expect(StringCalculator.add("1, 2", "3")).to eq(6)
        expect(StringCalculator.add("1, 2", 3)).to eq(6)
      end
    end
  end
end
