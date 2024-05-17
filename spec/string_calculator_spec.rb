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

    context "empty string input" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
        expect(StringCalculator.add(" ")).to eq(0)
        expect(StringCalculator.add(",")).to eq(0)
        expect(StringCalculator.add(nil)).to eq(0)
      end
    end

    context "empty array input" do
      it "returns 0" do
        expect(StringCalculator.add([])).to eq(0)
      end
    end

    context "array with empty elements input" do
      it "returns 0" do
        expect(StringCalculator.add([nil])).to eq(0)
        expect(StringCalculator.add([""])).to eq(0)
        expect(StringCalculator.add([nil, ""])).to eq(0)
      end
    end
  end
end
