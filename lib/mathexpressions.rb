require "mathexpressions/version"

module Mathexpressions
  class Error < StandardError; end

  numbers = %i(zero one two three four five six seven eight nine)
  numbers.each_with_index do |number_name, value|
    define_method(number_name) do |expression = nil|
      if expression
        expression + value
      else
        value
      end
    end
  end

  def plus(expression = nil)
    expression
  end
end
