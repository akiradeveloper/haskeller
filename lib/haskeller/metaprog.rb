module Kernel 
  def define_delegation(new, delegate)
    s = "def #{new}(*args, &blk); #{delegate}(*args, &blk) end"
    eval(s)
  end
end

if __FILE__ == $0
  define_delegation("printk", "puts") 
  printk "akiradeveloper"

  define_delegation("does", "[1,2,3].delete_if") 
  p does { |x| x < 2 }
end
