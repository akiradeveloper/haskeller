describe "inc" do 
  Lazy.inc(1) do |x|
    x + 2
  end.take(3) == [1,3,5]
end

describe "cycle" do
  Lazy.cycle([1,2]).take(3) == [1,2,1]
end

describe "repeat" do
  Lazy.repeat(3).take(3) == [3,3,3]
end
