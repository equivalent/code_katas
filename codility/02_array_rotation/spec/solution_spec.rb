require 'spec_helper'

# Write a function that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
#
# N and K are integers within the range [0..100];
# each element of array A is an integer within the range [−1,000..1,000]

module Solution
  def solution(a, k)
    k.times do
      a.unshift(a.pop)
    end
    a
  end
end

RSpec.describe Solution do
  include Solution

  let(:res) { solution(a, k) }

  context do
    let(:a) { [3, 8, 9, 7, 6] }
    let(:k) { 3 }

    it { expect(res).to eq [9, 7, 6, 3, 8] }
  end

  context do
    let(:a) { [0, 0, 0] }
    let(:k) { 1 }

    it { expect(res).to eq [0, 0, 0] }
  end

  context do
    let(:a) { [1,2,3,4] }
    let(:k) { 4 }

    it { expect(res).to eq [1,2,3,4] }
  end
end
