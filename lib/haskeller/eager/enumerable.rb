require_relative "../metaprog"

module Enumerable 

  renames = [
    ["foldl", "inject"],
    ["filter", "select"],
    ["concat", "flat_map"],
    ["length", "count"],
    ["elem?", "include?"]
  ]
  
  renames.each do |new, old|
    define_delegation(new, old)
  end

  def tail
  end

  def break
  end

  def span
  end

  def head
    e = to_enum
    e.next
  end

  def foldr(init, &blk)
    reverse_each do |x|
      yield( x, acc )
    end
  end

  def foldr1(&blk)
    foldr(0, &blk)
  end

  def foldl1(&blk)
    foldl(0, &blk)
  end

  def concat_map(&blk)
    map(&blk).concat
  end
  
  def or?
    any? { |x| x == True }
  end

  def and?
    all? { |x| x == True }
  end
end

class Array
  def head
    [0]
  end
end

if __FILE__ == $0
  p [1,2,3].filter { |x| x < 2 }
  p [1,2,3].foldl(0) { |acc, x| acc + x}
end
