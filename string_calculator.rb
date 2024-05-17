# require './string_calculator'

class StringCalculator
  attr_accessor :string

  def self.add(string)
    new(string).add
  end

  def initialize(string)
    @string = string
  end

  def add
    return "Invalid input" if string.to_s[-1] == "\n"
    return "Invalid inputs: #{invalid_numbers.join(', ')}" if invalid_numbers.any?

    numbers.sum
  end

  private

  def numbers
    @numbers ||= string
                 .to_s
                 .split(/\s*[,\n]+\s*/)
                 .map(&:to_i)
  end

  def invalid_numbers
    numbers.select { |n| n < 0 }
  end
end
