require_relative "metaprog"

module Enumerable 
  news = [
    "foldl",
    "dropWhile",
    "takeWhile"
  ]
  olds = [
    "inject",
    "drop_while",
    "take_while"
  ]

  news.zip(olds).each do |new, old|
    define_delegation(new, old)
  end

  def head
    [0]
  end

  def filter(&blk)
    delete_if do |x|
      ! blk.call(x)
    end
  end
end

if __FILE__ == $0
  p [1,2,3].filter { |x| x < 2 }
  p [1,2,3].foldl(0) { |acc, x| acc + x}
end
