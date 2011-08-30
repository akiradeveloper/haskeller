module Enumerable

  def mapL(&blk)
    Enumerator.new do |y|
      self.each do |x|
        y << (blk.call x)
      end
    end
  end

  def filterL(&blk)
    Enumerator.new do |y|
      self.each do |x|
        y << x if blk.call(x)
      end
    end
  end

  def zipL( *its )
    es = []
    es << self
    its.each do |it|
      es << it
    end
    Lazy.zip( es )
  end

  def takeL(n)
    e = to_enum
    Enumerator.new do |y|
      n.times do
        y << e.next
      end
    end
  end

  def take_whileL(&blk)
    e = to_enum
    Enumerator.new do |y|
      while( x=e.next; blk.call(x) ) do
        y << x     
      end
    end
  end
end

if __FILE__ == $0
  inf = 0..1.0/0
  p inf.take_whileL { |x| x < 100 }.to_a
end
