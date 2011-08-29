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


describe "dropWhile" do
  [3] == xs.dropWhile do |x|
    x < 3
  end
end

describe "takeWhile" do
  [1,2] == xs.takeWhile do |x|
    x < 3
  end
end
