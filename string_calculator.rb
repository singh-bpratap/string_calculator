# require './string_calculator'

class StringCalculator
  attr_accessor :numbers

  def self.add(*args)
    new(args).add
  end

  def initialize(*args)
    @numbers = [*args]
               .flatten
               .compact
               .map{|element| element.to_i}
  end

  def add
    numbers.sum
  end
end
