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
               .map{|element| sanitize_number(element)}
               .flatten
  end

  def add
    numbers.sum
  end

  private

  def sanitize_number(element)
    element.to_s.split(/\s*,\s*/).map(&:to_i)
  end
end
