module Enumerable

  def lazy_map(&blk)
    Lazy::Map.new(self, &blk)
  end

  def lazy_filter(&blk)
    Lazy::Filter.new(self, &blk)
  end
  
  def lazy_zip(*iters)
    xs = [self] + iters
    Lazy::Zip.new(xs)
  end

# Copy of a Blog.

#  def self.make_lazy(*syms)
#    syms.each do |sym|
#      class_eval <<-"EOD"
#        def lazy_#{sym}(*arg, &blk)
#          Enumerator.new do |e|
#            each do |x|
#	      #p x
#              [x].#{sym}(*arg, &blk).each { |y| p y; e << y }
#            end
#          end
#        end
#      EOD
#    end
#  end
#  
#  make_lazy :collect, :map, :select, :reject, :grep
#  make_lazy :find_all, :flat_map, :concat_collector

end
