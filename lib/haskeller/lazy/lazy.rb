require_relative "enumerable.rb"

module Lazy
  
  def self.normal_inc(x)
    if x.class.ancestors.include? Numeric
      lambda { |x| x + 1 } 
    else
      raise ArgumentError
    end
  end

  def self.inc(x, &blk)
    unless block_given?
      blk = normal_inc(x)
    end
    Enumerator.new do |y|
      i = x
      loop do
        y << i
        i = blk.call(i)
      end
    end  
  end

  def self.cycle(xs)
    return xs.cycle
  end

  def self.repeat(x)
    cycle( [x] )
  end
  
  def self.zip(es)
    es = es.map { |e| e.to_enum }
    Enumerator.new do |y|
      loop do
        xs = []
        es.each do |e|
          xs << e.next
        end
        y << xs
      end
    end
  end
end

if __FILE__ == $0
  e1 = Lazy.inc(1) 
  p e1
  e2 = Lazy.inc(2)
  p e1.mapL { |x| x*2 }.take 10
  p Lazy.zip( [e1, e2] ).take 10
  p e1.zipL( e2 ).take 10
  p e1.next

  p Lazy.cycle( [1,2] ).take 10
  p Lazy.repeat( [] ).take 10

  ee = Lazy.inc(1).filterL { |x| x < 5 }.takeL(4)
  p ee.count
  # ee.takeL(3).each { |x| print x }
end
