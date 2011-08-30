module Lazy

  class Iterator < Enumerator
    def each_with_index
      # According to "ruby.runpaint.org/ref/enumerator",
      # each_with_index can return self if given no block.
      unless block_given?
        self
      end
    end
  end

end
