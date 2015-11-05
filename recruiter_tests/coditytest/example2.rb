require 'minitest/autorun'

module Bar
  def self.find_index(ary, e)
    ary.each_index.select{|i| ary[i] == e}
  end
  
  # to be honestt I should come up with better enumerators
  # more "lazy enumerators" but this is as far as I came 
  # within the time limit
  def self.solution(ary)
    ary
      .inject({}) do |hash, e|
        hash[e] = find_index(ary, e) if ary.count(e) > 1
        hash
      end
      .inject([]) do |array, e|
        array << e.last.combination(2).to_a
        array
      end
      .flatten(1)
  end
end

describe Bar do
  it do
    ary = [3, 5, 6, 3, 3, 5]

    Bar.solution(ary).must_equal([[0,3], [0,4], [3,4], [1,5]])

    Bar.solution(ary).size.must_equal(4)
  end
end
