require_relative "enumerator"
require_relative "lazy/cycle"
require_relative "lazy/inc"

module Lazy
  def Lazy.repeat(x)
    cycle([x])
  end

  def Lazy.cycle(ary)
    Cycle.new(ary)
  end

  def Lazy.inc(init, &inc_lambda)
    Increment.new(init, &inc_lambda)
  end
end
