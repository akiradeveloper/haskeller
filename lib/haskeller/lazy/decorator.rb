require_relative "iterator"

module Lazy

  class Map < Iterator
    def initialize(e, &blk)
      super(e)
    end

    def rewind
      @e.rewind
    end
  
    def next
      blk.call( e.next )
    end
  
    def each
      loop do
        yield blk.call( e.next )
      end
    end
  end

  class Filter < Iterator
    def initialize(e, &blk)
      super(e)
    end

    def rewind
      @e.rewind
    end
  
    def next
    end
  
    def each
    end
  end

  class Zip < Iterator
    def initialize(*es)
      @es = es
    end
    
    def next
    end
    
    def each
    end

    def rewind
      @es.each do |e|
        e.rewind
      end
    end
  end

end
    

