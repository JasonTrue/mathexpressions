require "mathexpressions/version"

module Mathexpressions
  class Error < StandardError; end

  numbers = %i(zero one two three four five six seven eight nine)
  numbers.each_with_index do |number_name, value|
    define_method(number_name) do |expression = nil|
      if expression
        expression.operate(value)
      else
        Number.new(value)
      end
    end
  end

  class Expression
    attr_reader :value
    def initialize(value_expression)
      @value = value_expression
    end

    def operation?
      true
    end

    def operate(value)
       throw NotImplementedError("Needs to be overriden")
    end
  end

  class Plus < Expression
    def operate(value)
      value + @value.value
    end
  end

  class Minus < Expression
    def operate(value)
      value - @value.value
    end
  end


  class Times < Expression
    def operate(value)
       value * @value.value
    end
  end

  class DividedBy < Expression
    def operate(value)
      value / @value.value
    end
  end

  class Number
    attr_reader :value
    def operation?
      false
    end

    def initialize(value)
      @value = value
    end
  end


  def plus(expression = nil)
    if expression.operation?
      expression.operate(expression.value)
    else
      Plus.new(expression)
    end
  end

  def times(expression = nil)
    if expression.operation?
      expression.operate(expression.value)
    else
      Times.new(expression)
    end
  end

  def minus(expression = nil)
    if expression.operation?
      expression.operate(expression.value)
    else
      Minus.new(expression)
    end
  end

  def divided_by(expression = nil)
    if expression.operation?
      expression.operate(expression.value)
    else
      DividedBy.new(expression)
    end
  end
end
