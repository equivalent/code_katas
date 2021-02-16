require 'spec_helper'
require 'irb'
module Solution
  extend self

  def solution(a)
    a.size
  end
end

# ordered
#  exactly one element is missing.
#  given an array A, returns the value of the missing element.
#
#    N is an integer within the range [0..100,000];
#    the elements of A are all distinct;
#    each element of array A is an integer within the range [1..(N + 1)].

RSpec.describe Solution do
  let(:res) { described_class.solution(a) }

  context do
    let(:a) { [2, 3, 1, 5] }

    it { expect(res).to eq 4 }
  end
end
