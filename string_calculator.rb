# require './string_calculator'

class StringCalculator
  def self.add(string)
    self.new(string).add
  end

  def initialize(string)
    @string = string
  end

  def add
    return 0 if @string.to_s.empty?
    return "Invalid input" if @string.to_s[-1] == "\n"
    return "Invalid inputs: #{invalid_numbers.join(', ')}" if invalid_numbers.any?

    numbers.sum
  end

  private

  def numbers
    @numbers ||= if @string.match?(/^\/\/(.*?)/)
      delimiter = @string.split("//").last[0]
      @string = @string.split("\n")[-1]
      @string.split(delimiter).map(&:to_i)
    else
      @string.split(/[,\n]+/).map(&:to_i)
    end
  end

  def invalid_numbers
    numbers.select { |n| n < 0 }
  end
end
