require "mathexpressions/version"

module Mathexpressions
  class Error < StandardError; end

  def one(expression = nil)
    if expression
      expression + 1.0
    else
      1.0
    end
  end

  def two(expression = nil)
    if expression
      expression + 1.0
    else
      2.0
    end
  end

  def plus(expression = nil)
    expression
  end
end
