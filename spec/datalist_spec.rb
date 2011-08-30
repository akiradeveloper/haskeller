xs = [1,2,3]
ys = [1]

describe "head" do
  xs.head == 1
end

describe "filter" do
  [1] == xs.filter do |x|
    x < 2
  end
end

describe "foldl" do
  6 == xs.foldl do |acc, x|
    acc + x
  end
end


describe "drop_while" do
  [3] == xs.drop_while do |x|
    x < 3
  end
end

describe "take_while" do
  [1,2] == xs.take_while do |x|
    x < 3
  end
end
