# require './string_calculator'

class StringCalculator
  attr_accessor :numbers

  def self.add(string)
    new(string).add
  end

  def initialize(string)
    @numbers = string.to_s.split(/\s*,\s*/).map(&:to_i)
  end

  def add
    numbers.sum
  end
end
