require "mathexpressions/version"

module Mathexpressions
  class Error < StandardError; end

  %i(zero one two three four five six seven eight nine)
    .each_with_index do |number_name, value|
    define_method(number_name) do |expression = nil|
      if expression
        expression.operate(value)
      else
        Number.new(value.to_f)
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

  %w(Plus Minus Times DividedBy).each do |operation|
    # shamelessly stolen from ActiveSupport (only the bits I need)
    underscore = operation.gsub(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2'.freeze)
    underscore.gsub!(/([a-z\d])([A-Z])/, '\1_\2'.freeze)
    underscore.downcase!
    operation_klass = Object.const_get("Mathexpressions::#{operation}")

    underscore_sym = underscore.to_sym
    define_method underscore_sym do |expression|
      if expression.operation?
        expression.operate(expression.value)
      else
        operation_klass.new(expression)
      end
    end
  end
end
