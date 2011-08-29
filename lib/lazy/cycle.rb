module Lazy

  class Cycle < Enumerator

    def initialize(ary)
      @ary = ary
      @idx = 0
    end
    def each_with_index
      unless block_given?
        self   
      end
    end
    def each
      unless block_given?
        self
      end
      loop do
        yield( get )
	forward
      end
    end
    def rewind
      @idx = 0
      self
    end
    def next
      forward
      get
    end
    private
    def forward
      @idx += 1
    end
    def get
      @ary[pos]
    end
    def pos
      @idx % @ary.size
    end
  end
end

if __FILE__ == $0
  p Lazy.repeat(1)
  p Lazy.repeat(10).each_with_index
  p Lazy.repeat(1).flat_map
  p [1,2,3].map
  Lazy.cycle([1,2,3]).take(10).each_with_index do |x, i| 
    print "x:#{x} at idx:#{i}\n"
  end
end
