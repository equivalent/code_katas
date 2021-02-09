require 'irb'
module Solution
  extend self

  def solution(a,b)
    b_item = get_b_item(b)
    index_alter = 0
    a.each do |a_item|
      index_alter += 1   # each_with_index will not help in this case as we need to manipulate current index
      if b_item && b_item > a_item
        a.insert(index_alter, b_item)
        index_alter += 1
        b_item = get_b_item(b)
      end
    end
  end

  private
    def get_b_item(b)
      b.shift
    end
end
