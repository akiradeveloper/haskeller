module Lazy

#  def Lazy.list
#  end
# 
#  class Expr
#    def initialize(expr)
#      @expr = expr
#    end 
#    def evaluate
#      xs = @expr.split(",")
#      case xs.size
#      when 1
#        a = xs[0].delete(".")
#      when 2
#        a = xs[0]
#	b = xs[1].delete(".")
#      else
#      end
#    end

  class Increment < Enumerator
    
    def initialize(init, &inc_lambda)
      @init = init
      @state = init
      @inc = inc_lambda
      @idx = 0
    end

    def next
      forward
      @state
    end

    def each
      loop do
        yield @state
	forward
      end     
    end

    def each_with_index
      # According to "ruby.runpaint.org/ref/enumerator",
      # each_with_index can return self if given no block.
      unless block_given?
        self
      end
    end

    def rewind
      @idx = 0
      @state = @init
      self
    end

    private
    def forward
      @state = @inc.call(@state)
    end
  end
end

if __FILE__ == $0
  p Lazy.inc(1) { |x| x + 1 }
  p Lazy.inc(1) { |x| x + 1 }.take(10)
  Lazy.inc(1) do |x| x + 2 end.take(10).each do |x|
    print "x:#{x}\n"
  end
  Lazy.inc(1) { |x| x + 2 }.take(10).each_with_index do |x, i|
    print "x:#{x} at idx:#{i}\n"
  end
end
