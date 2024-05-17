require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns true if add method is defined" do
      calculator = StringCalculator.new
      expect(calculator.public_methods.include?(:add)).to be_truthy
    end
  end
end
