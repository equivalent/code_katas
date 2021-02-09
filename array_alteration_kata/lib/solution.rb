require 'irb'
module Solution
  extend self

  def solution(a,b)
    a.each_with_index do |a_item, index|
      b.each do |b_item|
        a.insert(index + 1, b_item) if b_item > a_item
      end
    end
    a
  end
end
