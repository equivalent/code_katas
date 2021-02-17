require 'spec_helper'
module Solution
  extend self

  def solution(a)
    h = {}
    a.each do |el|
      h[el.abs] ||= true
    end
    h.keys.size
  end
end


# https://app.codility.com/programmers/lessons/6-sorting/distinct/

# given an array A consisting of N integers, returns the number of distinct values in array A.
# N is an integer within the range [0..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
#
# solution was evaluated  83%  (performance was not effitient enough)

RSpec.describe Solution do

  let(:res) { described_class.solution(a)  }

  context do
    let(:a) { [2,1,1,2,3,1] }

    it { expect(res).to eq(3) }
  end

  # my examples
  context do
    let(:a) { [2,-1,1,2,3,1, -3] }

    it { expect(res).to eq(3) }
  end

  context do
    let(:a) { [-1, 0, 1] }

    it { expect(res).to eq(2) }
  end

  context do
    let(:a) { [] }
    it { expect(res).to eq(0) }
  end

  context do
    let(:a) { [10000] }
    it { expect(res).to eq(1) }
  end

  context do
    let(:a) { (-1_000_000..1_000_000).to_a}
    it { expect(res).to eq(1000001) }
  end
end
